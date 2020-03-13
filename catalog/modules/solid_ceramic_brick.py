import math

def solid_ceramic_brick(scheme, walls):
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
    elements = scheme['elements']
    lines = scheme['lines']
    points = scheme['points']
    point0 = dict()
    point1 = dict()
    thick_bear = 380 # принимаем толщину несущей стены
    thick_part = 120 # принимаем толщину перегородки
    square_bear = 0
    square_part = 0

    # посчитаем кол-во кирпичей
    for element in elements:  # идем по массиву элементов, находим среди них стены и проверяем их тип
        if element['type'] == "wall":  # если это стена
            if element['wallType'] in walls: # если этот тип стены нужно рассчитать из этого материала
                if element['distance'] > 0 and len(element['ids']) == 1: # если это окружность
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
                    length = math.sqrt((point0['x'] - point1['x']) ** 2 + (point0['y'] - point1['y']) ** 2)
                # определив длину элемента, смотрим, что же это за стена
                if "bearing" in element['wallType']:  # если это несущая стена
                    length = length + thick_bear # прибавляем толщину стены, чтобы сдеать поправку на сохранение внутренних размеров
                    square_bear = square_bear + round(length/1000 * 3, 2) # пока тестовый расчет, поэтому просто переводим в полщадь в метрах квадратных, типа высота три метра
                elif "partition" in element['wallType']:  # если это перегородка, 
                    length = length + thick_part # прибавляем толщину стены, чтобы сдеать поправку на сохранение внутренних размеров
                    square_part = square_part + round(length/1000 * 3, 2) # пока тестовый расчет, поэтому просто переводим в полщадь в метрах квадратных, типа высота три метра
    vol = square_bear*thick_bear/1000 + square_part*thick_part/1000 # посчитаем объем кирпичной кладки в м куб.
    bricks = round(vol/0.002535, 0) # посчитаем кол-во кирпичей с учетом раствора

    # посчитаем тепловое сопротивление кладки
    R = thick_bear/0.00081 # лямбда кирпича взята 0.81

    result = {
        'bricks': bricks,
        'R': R
    }

    return result
