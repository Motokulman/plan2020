from catalog.models import *
from django.contrib.auth.models import User
from django.contrib.auth.models import Permission, Group
from catalog.modules import solid_ceramic_brick
from django.core import serializers
from django.shortcuts import get_object_or_404
import json
import math

# Нащи вычисления:


def get_city(request):
    profile = Profile.objects.get(user__username=request.user)
    city_name = profile.city  # кзнаем из профиля город пользователя
    city = City.objects.get(name=city_name)  # получаем объект города
    return city


def get_local_params(request, city):
    indoor_temperature = 20  # температура по умолчанию внутри помещения
    # city = get_city(request)
    # определяем ГСОП https://www.teplo-info.com/snip/otopitelniy_period
    gsop = int((indoor_temperature - city.heating_period_temperature)
               * city.heating_period_duration)
    R_req = {}  # определяем тепловое сопротивленеие
    R_req["wall"] = round(0.00035*gsop + 1.4, 1)
    R_req["roof"] = round(0.0005*gsop + 2.2, 1)
    R_req["floor"] = round(0.00045*gsop + 1.9, 1)
    # определяем тепловое сопротивленеие для окон.Оно нелинейно меняестся: СП 50.13330.2012 Тепловая защита зданий., табл 4
    if gsop <= 6000:
        R_req["window"] = round(0.000075*gsop + 0.15, 2)
    elif gsop < 8000:
        R_req["window"] = round(0.0000833333*gsop + 0.1, 2)
    else:
        R_req["window"] = round(0.00008125*gsop + 0.05, 2)

    return gsop, R_req


def get_materials(city):  # получение списка материалов, доступных в городе пользователя
    group = Group.objects.get(
        permissions__codename='add_rockwallmaterialprice')
    # получили всех пользователей,являющихся поставщиками из города, в котором живет текущий пользователь
    users = User.objects.filter(groups=group).filter(
        profile__city__name=city.name)
    # Получим массив всех стеновых материалов, которые есть у местных поставщиков и сразу сделаем этот массив с уникальными элементами. исключая лицевой кирпич
    wall_rock_materials = RockWallMaterialPrice.objects.filter(
        owner__in=users).exclude(name__purpose='fasade').distinct('name_id')
    return wall_rock_materials


def get_algorithms(wall_rock_materials):
    # определим уникальные алгоритмы
    algs = list()
    for material in wall_rock_materials:
        if material.name.algorithm.identifier not in algs:
            algs.append(material.name.algorithm.identifier)
    algorithms = Algorithm.objects.filter(identifier__in=algs)
    return algorithms


def get_plan_cost(request, pk, selected_algs):
    result = list()
    city = get_city(request)  # получим город пользователя
    # получим нормативные показатели для региона пользователя
    params = get_local_params(request, city)
    volumes = get_volumes(request, pk, city)  # получим объемы стен
    # получим доступные в городде пользователя материалы
    wall_rock_materials = get_materials(city)

    # бежим по массиву алгоритмов и расчитывам для каждого из них количество материалов
    for algorithm in selected_algs:
        if algorithm.identifier == 'solid_ceramic_brick':
            res = solid_ceramic_brick(params, volumes)

    result.append(res)

    return result
