# from catalog.models import *

import math


def porotherm_44(element, lines, points):
    # walls - строка, где перечислены типы стен, какие нужно посчитать.
    #     ф = {
    # bearing_living_outdoor
    # bearing_living_indoor
    # bearing_uninhabited_outdoor
    # bearing_uninhabited_indoor
    # partition_living
    # partition_uninhabited
    # }
    # расчитываем количество кирпича. Предполагаем, что размеры на схеме - это внутренние размеры, и чтобы их сохранить увеличиваем габариты дома на толщину стены
    # сначала - несущие стены. сразу подгонка под размер. Получая исходные линии, изменяем их внутри функции с целью подгонки под размер материала. Или не заморачиваться?
    point0 = dict()
    point1 = dict()
    thick = 440  # принимаем толщину
    width = 250
    height = 219
    square = 0

    # посчитаем кол-во блоков
       # если это окружность
       if element['distance'] > 0 and len(element['ids']) == 1:
            length = element.distance * 3.14  # поскольку пока distance равна радиусу
        else:  # если это что то из прямых линий, тобежим по массиву id линий, это м.б. одна линия или несколько, если это эркер
            for line_id in element['ids']:
                for line in lines:
                    if line['id'] == line_id:
                        for point in points:
                            if point['id'] == line['id0']:
                                point0['x'] = point['x']
                                point0['y'] = point['y']
                            if point['id'] == line['id1']:
                                point1['x'] = point['x']
                                point1['y'] = point['y']
            length = math.sqrt(
                (point0['x'] - point1['x']) ** 2 + (point0['y'] - point1['y']) ** 2)
        length = length + width  # прибавляем толщину стены, чтобы сдеать поправку на сохранение внутренних размеров
        square = square + length/1000 * 3  # пока тестовый расчет, поэтому просто переводим в полщадь в метрах квадратных, типа высота три метра

    # посчитаем объем кирпичной кладки в м куб.
    # vol = square_bear*thick_bear/1000 + square_part*thick_part/1000
    # посчитаем кол-во кирпичей с учетом раствора
    blocks = square/width/height  # посчитаем кол-во блоков. В ДАЛЬНЕЙШЕМ ДОБАВИТЬ УВЕЛИЧЕНИЕ КОЛ-ВА БЛОКОВ ИЗ ЗА ПИЛЕЖКИ ПО ВЫСОТЕ ИЛИ УВЕЛИЧЕНИЯ ВЫСОТЫ ЭТАЖА
    # посчитаем объем раствора, куб. м. Толщина раствора -12мм
    mortar_vol = blocks * (thick * width)/83333333
    mortar_weight = mortar_vol * 2.5 # посчитаем массу расвора, тонн
    clue_weight = mortar_weight/2  # по данным производителя выход теплого раствора из 1 кг сухой массы в два раза больше чем обычного раствора
    sand_weight = mortar_weight * 0.25  # посчитаем массу песка, тонн
    cement_weight = mortar_weight * 750  # посчитаем массу цемента, кг

    # посчитаем тепловое сопротивление кладки
    R = thick/0.000144  # лямбда блока взята 0.144 https://www.wienerberger.ru/catalog/wall/keramicheskiye-bloki/porotherm-44.html

    result = {
        'blocks': blocks,
        'R': R,
        'clue': clue_weight,
        'sand': sand_weight,
        'cement': cement_weight,
    }

    return result
