import math


def solid_ceramic_brick(scheme, walls):
    # walls - строка, где перечислены типы стен, какие нужно посчитать по этому алгоритму
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
    
    elements = scheme['elements']
    lines = scheme['lines']
    points = scheme['points']
    point0 = dict()
    point1 = dict()
    thick_bear = 380  # принимаем толщину несущей стены
    thick_part = 120  # принимаем толщину перегородки
    square_bear = 0
    square_part = 0

    # посчитаем кол-во кирпичей
    for element in elements:  # идем по массиву элементов, находим среди них стены и проверяем их тип
        if element['type'] == "wall":  # если это стена
            # если этот тип стены нужно рассчитать из этого материала
            if element['wallType'] in walls:
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
                # определив длину элемента, смотрим, что же это за стена
                if "bearing" in element['wallType']:  # если это несущая стена
                    # прибавляем толщину стены, чтобы сдеать поправку на сохранение внутренних размеров
                    length = length + thick_bear
                    # пока тестовый расчет, поэтому просто переводим в полщадь в метрах квадратных, типа высота три метра
                    square_bear = square_bear + round(length/1000 * 3, 2)
                # если это перегородка,
                elif "partition" in element['wallType']:
                    # прибавляем толщину стены, чтобы сдеать поправку на сохранение внутренних размеров
                    length = length + thick_part
                    # пока тестовый расчет, поэтому просто переводим в полщадь в метрах квадратных, типа высота три метра
                    square_part = square_part + round(length/1000 * 3, 2)
    
    vol = square_bear*thick_bear/1000 + square_part*thick_part/1000 # посчитаем объем кирпичной кладки в м куб.
    bricks = vol/0.002535 # посчитаем кол-во кирпичей с учетом раствора
    mortar_vol = bricks * 0.00072  # посчитаем объем раствора, куб. м. Толщина слоя раствора - 12мм
    mortar_weight = mortar_vol * 2.5 # посчитаем массу расвора, тонн
    sand_weight = mortar_weight * 0.25 # посчитаем массу песка, тонн
    cement_weight = mortar_weight * 750 # посчитаем массу цемента, кг

    # посчитаем тепловое сопротивление кладки
    R = thick_bear/0.00081  # лямбда кирпича взята 0.81

    result = {
        'bricks': round(bricks, 0),
        'R': round(R, 2),
        'sand': round(sand_weight, 0),
        'cement': round(cement_weight, 0)
    }

    return result
