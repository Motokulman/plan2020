from django.shortcuts import render
from .forms import LandCreateForm, SurveyCreateForm, WellCreateForm, LayerCreateForm
from django.views.generic.edit import CreateView, UpdateView, DeleteView    
from django.views import generic
from land.models import *
from django.urls import reverse
from django.urls import reverse_lazy
from django.http import HttpResponseRedirect
from django.contrib.auth.mixins import LoginRequiredMixin, PermissionRequiredMixin
from django.shortcuts import get_object_or_404
from django.contrib.auth.decorators import login_required
import math



# обработка создания участков
class LandCreateView(CreateView):
    template_name = 'land/land_form.html'
    form_class = LandCreateForm


    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.owner = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(LandCreateView, self).get_initial(**kwargs)
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(LandCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['owner'] = self.request.user
        return kwargs


# class LandDetailView(generic.DetailView):
#     model = Land

# функция просмотра пользователем геологического исследования для своего учатска. Фильтация исследований по участку и по заказчику
@login_required
def land_detail_view(request, pk):
    land = get_object_or_404(Land, pk=pk)
    my_surveys_list = Survey.objects.filter(land=land, customer=request.user)

    context = {
        'land': land,
        'my_surveys_list': my_surveys_list,
    }

    return render(request, 'land/land_detail.html', context)


class LandDelete(DeleteView):
    model = Land
    success_url = reverse_lazy('dashboard')

# Обработка создания геологических исследований
class SurveyCreateView(CreateView):
    template_name = 'survey/survey_form.html'
    form_class = SurveyCreateForm


    def form_valid(self, form):
        self.object = form.save(commit=False)
        self.object.contractor = self.request.user
        self.object.save()
        return HttpResponseRedirect(self.get_success_url())

    def get_initial(self, *args, **kwargs):
        initial = super(SurveyCreateView, self).get_initial(**kwargs)
        return initial

    def get_form_kwargs(self, *args, **kwargs):
        kwargs = super(SurveyCreateView, self).get_form_kwargs(*args, **kwargs)
        kwargs['contractor'] = self.request.user
        return kwargs


# class SurveyDetailView(generic.DetailView):
#     template_name = 'survey/survey_detail.html'
#     model = Survey

# функция просмотра деталей геологического исследования. Выводит скважины, какие в нем есть. Добавлять и редактировать скважины нужно чтобы могли только с соотв. правами - это пока не сделано
@login_required
def survey_detail_view(request, pk):
    survey = get_object_or_404(Survey, pk=pk)
    my_wells_list = Well.objects.filter(survey=survey)

    new_well = None # задаем переменную, отвечающую за создание скважины
    if request.method == 'POST':
        well_form = WellCreateForm(request.POST)
        if well_form.is_valid():
            new_well = well_form.save(commit=False) # создаем скважину, но еще не сохраняем ее в базе данных
            new_well.survey = survey # указываем, от какого исследования эта скважина
            new_well.save() # и только потом сохраняем
    else:
        well_form = WellCreateForm()

    context = {
        'survey': survey,
        'my_wells_list': my_wells_list,
        'new_well': new_well,
        'well_form': well_form,
    }

    return render(request, 'survey/survey_detail.html', context)


@login_required
def well_detail_view(request, pk):
    well = get_object_or_404(Well, pk=pk)
    my_layers_list = Layer.objects.filter(well=well)
    height = well.height / 100 # переведем высоту скважины из см в м
    depth = - height # присвоим глубине скважины отрицательную начальныю высоту в метрах, чтобы при дальнейшем расчете она автоматом вычлась.
    Hw0 = well.Hw0
    Hw1 = well.Hw1
    
    Mk = 0
    R2 = 0 # Расчетные сопротивления под нижним концом набивных и буровых свай, кПа. Здесь - 2 метра
    R2_5 = 0 # 2.5 метра
    R3 = 0 # 3 метра
    F_side_2 = 0 # несущая пособность на боковой поверхности
    F_side_2_5 = 0 # несущая пособность на боковой поверхности
    F_side_3 = 0 # несущая пособность на боковой поверхности
    IP = 0
    IL = 0
    Mk = 0
    K_porosity = 0
    
    def get_Mk(lay):
        Mk = 0
        if isinstance(lay.m, int):
            a250 = 100 * lay.m250/lay.m # определяем частный остаток на каждом сите в процентах
            a125 = 100 * lay.m125/lay.m
            a063 = 100 * lay.m063/lay.m
            a0315 = 100 * lay.m0315/lay.m
            a016 = 100 * lay.m016/lay.m
            A250 = a250 # определяем полный остаток на каждом сите
            A125 = a250 + a125
            A063 = a250 + a125 + a063
            A315 = a250 + a125 + a063 + a0315
            A016 = a250 + a125 + a063 + a0315 + a016
            Mk = (A250 + A125 + A063 + A315 + A016) / 100 # определяем модуль крупности песка
        return Mk

    def get_R(lay):
        IP = get_IP(lay)
        IL = get_IL(lay)
        Mk = get_Mk(lay)
        K_porosity = get_K_porosity(lay)
        Rx = 0
        if IP < 1: # если это песок
            if Mk > 2.5: # если это крупный песок
                Rx = 2000
            elif Mk > 2: # если это средней крупности песок
                Rx = 1500
            elif Mk > 1.5: # если это мелкий песок
                Rx = 800
            elif Mk >0: # если это пылеватый песок с проверкой на вычисление Mk
                Rx = 500
            if K_porosity < 0.55: # если это плотный песок, используем повышающий коэффициент
                Rx = Rx * 1.3
        elif IP < 17: # если это супесь или суглинок
            # if IL <= 0.6: # исключим из расчета глины с показателем текучести более 0.6
            Rx = 950 - 400 * K_porosity - 500 * IL # формула, отражающая интерполяцию значений R в зависимости от показателя тиекучести и пористости табл. 15.3.  СП 24.13330.2011 Свайные фундаменты. Актуализированная редакция СНиП 2.02.03-85 (с Опечаткой, с Изменениями N 1, 2, 3),
        elif IP >= 17: # если это глина
            # if IL <= 0.6: 
            Rx = 2300 + 1667 * K_porosity * IL - 2000 * K_porosity - 1833 * IL # формула, отражающая интерполяцию значений R в зависимости от показателя тиекучести и пористости табл. 15.3.  СП 24.13330.2011 Свайные фундаменты. Актуализированная редакция СНиП 2.02.03-85 (с Опечаткой, с Изменениями N 1, 2, 3),
        return Rx

    def get_IP(lay):
        IP = -1
        if isinstance(lay.WL, float) and isinstance(lay.WP, float):
            IP = lay.WL - lay.WP
        return IP

    def get_IL(lay):
        IL = 0
        if isinstance(lay.WL, float) and isinstance(lay.WP, float) and isinstance(lay.W, float):
            IL = (lay.W - lay.WP) / (lay.WL - lay.WP)
        return IL

    def get_K_porosity(lay):
        K_porosity = 0
        if isinstance(lay.Ros, float) and isinstance(lay.Rod, float):
            K_porosity = (lay.Ros - lay.Rod) / lay.Rod
        return K_porosity

    def get_f(lay):
        IP = get_IP(lay)
        IL = get_IL(lay)
        Mk = get_Mk(lay)
        K_porosity = get_K_porosity(lay)
        f = 0
        if IP >= 0: # проверка на существование IP
            if IP < 1: # если это песок
                if Mk > 2: # если это крупный и средней крупности песок
                    f = 153 - 133 * K_porosity
                elif Mk > 1.5: # если это мелкий песок
                    f = 110 - 100 * K_porosity
                elif Mk >0: # если это пылеватый песок с проверкой на вычисление Mk
                    f = 100 - 100 * K_porosity
            elif IP >= 1: # если это супесь или суглинок или глина
                f = 74 + 3.7 * K_porosity * IL - 19 * K_porosity - 57 * IL # формула, отражающая интерполяцию значений f в зависимости от показателя тиекучести и пористости табл. 15.2.  СП 24.13330.2011 Свайные фундаменты. Актуализированная редакция СНиП 2.02.03-85 (с Опечаткой, с Изменениями N 1, 2, 3),
        return f

    def get_Sr(lay): # определим коэффициент водонасыщения грунта данного слоя
        Sr = 0
        if isinstance(lay.W, float) and isinstance(lay.Ros, float) and (K_porosity > 0):
            Sr = (lay.W * lay.Ros) / (K_porosity * 1)
        return Sr

    def get_F_side(l, d, w): # длина сваи, диаметр и уровень УГВ в метрах
        previous_depth = 0
        calc_from = height
        R_side = 0
        # F_list = []
        for i in my_layers_list:
            # i = my_layers_list[0]
            top_minus = 0
            bottom_minus = 0
            if (previous_depth + i.power) <= calc_from: # если даже низ слоя ниже высотной отметки самой низкой скважины (планируемой планировки грунта)
                previous_depth = previous_depth + i.power
                # F_list.append(previous_depth)
                continue # выходим не считая ничего
            elif previous_depth < calc_from: # если верх слоя выше чем высотная отметка 
                top_minus = calc_from - previous_depth # полготовим разницу к вычитанию
            if (previous_depth + i.power) > (l + calc_from): # если слой идет глубже, чем нам нужнео считать, подготовим разницу к вычитанию
                bottom_minus = previous_depth + i.power - l - calc_from
            R_side = R_side + get_f(i) * (i.power - top_minus - bottom_minus)
            # F_list.append(get_f(i)) # отладочная информацмя
            previous_depth = previous_depth + i.power

            if previous_depth > (l + calc_from):
                break


            # if previous_depth + i.power <= l:
            #     R_side = R_side + get_f(i) * i.power
            #     previous_depth = previous_depth + i.power
            # else:
            #     h = 2 - previous_depth
            #     R_side = R_side + get_f(i) * h
            #     break
        R_side = R_side * d * math.pi # умножаем полученное сопротивление на периметр ствола сваи
        R_side = R_side * 0.9 # вводим понижающий коэффициент: условия работы - с выемкой грунта
        if isinstance(w, float):
            if l >= w: # Если уровень воды таков, что дно скважины будет под водой, то
                R_side = R_side * 0.6
            else:
                R_side = R_side * 0.8
        else: R_side = R_side * 0.8

        return R_side

# тестовая функция
    # def get_F_side_list(l, d, w): # длина сваи, диаметр и уровень УГВ в метрах
    #     previous_depth = 0
    #     calc_from = height
    #     R_side = 0
    #     F_list = []
    #     for i in my_layers_list:
    #         # i = my_layers_list[0]
    #         top_minus = 0
    #         bottom_minus = 0
    #         if (previous_depth + i.power) <= calc_from: # если даже низ слоя ниже высотной отметки самой низкой скважины (планируемой планировки грунта)
    #             previous_depth = previous_depth + i.power
    #             break # выходим не считая ничего
    #         elif previous_depth < calc_from: # если верх слоя выше чем высотная отметка 
    #             top_minus = calc_from - previous_depth # полготовим разницу к вычитанию
    #         if (previous_depth + i.power) > (l + calc_from): # если слой идет глубже, чем нам нужнео считать, подготовим разницу к вычитанию
    #             bottom_minus = previous_depth + i.power - l - calc_from
    #         R_side = get_f(i) * (i.power - top_minus - bottom_minus) # R_side +
    #         previous_depth = previous_depth + i.power
    #         F_list.append(R_side)
    #         if previous_depth > (l + calc_from):
    #             break

    #     return F_list



    new_layer = None
    if request.method == 'POST':
        layer_form = LayerCreateForm(request.POST)
        if layer_form.is_valid():
            new_layer = layer_form.save(commit=False) 
            new_layer.well = well # это мы сохранили скважину, которой принадлежит этот слой
            new_layer.save() 
    else:
        layer_form = LayerCreateForm()

    # определим суммарнкю глубину скважины за вычетом разницы высоных отметок скважин depth и сохраним слои, которые попадутся нам на разных глубинах для дальнейших вычислений
    for i in my_layers_list:
        depth_previous = depth
        depth = depth + i.power
        if depth_previous <= 2 and depth > 2:
            lay2000 = i # сохранили слой, который будет на глубине 2 метра
        if depth_previous <= 2.5 and depth > 2.5:
            lay2500 = i       
        if depth_previous <= 3 and depth > 3:
            lay3000 = i
 
    

    if depth > 2: # если глубина [строго] больше 2-х метров, можем определить несущую способность на этой глубине

        R2 = get_R(lay2000)
        # для сваи 2х300
        F = R2 * 0.071  + get_F_side(2, 0.3, Hw1)
        if IP >= 1 and get_Sr(lay2000) < 0.85:
            F = F * 0.8
        well.F_2000_300 = F
        # для сваи 2х350
        F = R2 * 0.096 + get_F_side(2, 0.35, Hw1)
        if IP >= 1 and get_Sr(lay2000) < 0.85:
            F = F * 0.8
        well.F_2000_350 = F
        # для сваи 2х400
        F = R2 * 0.126 + get_F_side(2, 0.4, Hw1)
        if IP >= 1 and get_Sr(lay2000) < 0.85:
            F = F * 0.8
        well.F_2000_400 = F
        
    if depth > 2.5:
        R2 = get_R(lay2500)
        # для сваи 2.5х300
        F = R2 * 0.071 + get_F_side(2.5, 0.3, Hw1)
        if IP >= 1 and get_Sr(lay2500) < 0.85:
            F = F * 0.8
        well.F_2500_300 = F
        # для сваи 2.5х350
        F = R2 * 0.096 + get_F_side(2.5, 0.35, Hw1)
        if IP >= 1 and get_Sr(lay2500) < 0.85:
            F = F * 0.8
        well.F_2500_350 = F
        # для сваи 2.5х400
        F = R2 * 0.126 + get_F_side(2.5, 0.4, Hw1)
        if IP >= 1 and get_Sr(lay2500) < 0.85:
            F = F * 0.8
        well.F_2500_400 = F
    if depth > 3:
        R2 = get_R(lay3000)
        # для сваи 3х300
        F = R2 * 0.071 + get_F_side(3, 0.3, Hw1)
        if IP >= 1 and get_Sr(lay3000) < 0.85:
            F = F * 0.8
        well.F_3000_300 = F
        # для сваи 3х350
        F = R2 * 0.096 + get_F_side(3, 0.35, Hw1)
        if IP >= 1 and get_Sr(lay3000) < 0.85:
            F = F * 0.8
        well.F_3000_350 = F
        # для сваи 3х400
        F = R2 * 0.126 + get_F_side(3, 0.4, Hw1)
        if IP >= 1 and get_Sr(lay3000) < 0.85:
            F = F * 0.8
        well.F_3000_400 = F

    well.save() 

# выведем отладочную информацию
    # number = 0
    # # IP = 0
    # # IL = 0
    # # Mk = 0
    # # K_porosity = 0
    # R2 = 0
    # Sr = 0
    # F_side_300 = 0
    # F_side_350 = 0
    # F_side_400 = 0
    # if (depth > 3):
    #     number = lay3000.number
    #     IP = get_IP(lay3000)
    #     IL = get_IL(lay3000)
    #     Mk = get_Mk(lay3000)
    #     K_porosity = get_K_porosity(lay3000)
    #     R2 = get_R(lay3000)
    #     Sr = get_Sr(lay3000)
    #     F_side_300 = get_F_side(3, 0.3, Hw1)
    #     F_side_350 = get_F_side(3, 0.35, Hw1)
    #     F_side_400 = get_F_side(3, 0.4, Hw1)



    context = {
        'well': well,
        # 'F_side_list': get_F_side(2, 0.3, Hw1)
        'my_layers_list': my_layers_list,
        'new_layer': new_layer,
        'layer_form': layer_form,
        'depth': depth,
        'Hw0': Hw0,
        'Hw1': Hw1,
        'F_2000_300': well.F_2000_300,
        'F_2000_350': well.F_2000_350,
        'F_2000_400': well.F_2000_400,
        'F_2500_300': well.F_2500_300,
        'F_2500_350': well.F_2500_350,
        'F_2500_400': well.F_2500_400,
        'F_3000_300': well.F_3000_300,
        'F_3000_350': well.F_3000_350,
        'F_3000_400': well.F_3000_400,
        # выведем отладочную информацию
        'height': height,
        # # 'IP': IP,
        # # 'IL': IL,
        # # 'Mk': Mk,
        # # 'K_porosity':  K_porosity,
        # 'R2': R2,
        # 'Sr': Sr,
        # 'F_side_300': F_side_300,
        # 'F_side_350': F_side_350,
        # 'F_side_400': F_side_400,
        # 'lay2000_number': lay2000.number,
        # 'lay2500_number': lay2500.number,
        # 'lay3000_number': lay3000.number,
    }

    return render(request, 'well/well_detail.html', context)




class SurveyDelete(DeleteView):
    model = Survey
    template_name = 'survey/survey_confirm_delete.html'
    success_url = reverse_lazy('dashboard')

# создание скважины для геологического исследования



# class WellCreateView(CreateView):
#     template_name = 'well/well_form.html'
#     form_class = WellCreateForm
#     # survey = get_object_or_404(Survey, pk=pk)

#     def form_valid(self, form):
#         self.object = form.save(commit=False)
#         # survey = get_object_or_404(Survey, pk=pk)
#         # self.object.survey = survey
#         self.object.save()
#         return HttpResponseRedirect(self.get_success_url())

        







class WellDelete(DeleteView):
    model = Well
    template_name = 'well/well_confirm_delete.html'
    success_url = reverse_lazy('dashboard')

# создание грунтового слоя в скважине
# class LayerCreateView(CreateView):
#     template_name = 'layer/layer_form.html'
#     form_class = LayerCreateForm

#     def form_valid(self, form):
#         self.object = form.save(commit=False)
#         # self.object.well = self.request.well
#         self.object.save()
#         return HttpResponseRedirect(self.get_success_url())

class LayerDetailView(generic.DetailView):
    template_name = 'layer/layer_detail.html'
    model = Layer

class LayerDelete(DeleteView):
    model = Layer
    template_name = 'layer/layer_confirm_delete.html'
    success_url = reverse_lazy('dashboard')