def  solid_ceramic_brick(params, scheme, walls):
    # walls - массив, где перечислены типы стен, какие нужно посчитать.
    #     ф = {
    #     "living_partition": 0,
    #     "uninhabited_partition": 0,
    #     "outdoor_living_bearing": 0,
    #     "indoor_living_bearing": 0,
    #     "outdoor_uninhabited_bearing": 0,
    #     "indoor_uninhabited_bearing": 0
    # }
    # расчитываем количество кирпича. Предполагаем, что размеры на схеме - это внутренние размеры, и чтобы их сохранить увеличиваем габариты дома на толщину стены
    # сначала - несущие стены. сразу подгонка под размер. Получая исходные линии, изменяем их внутри функции с целью подгонки под размер материала. Или не заморачиваться?
    elements = scheme['elements']
    lines = scheme['lines']
    points = scheme['points']

    for wall in walls # Идем по массиву типов стен, которые будут из этого материала
        for element in elements: # идем по массиву элементов, находим среди них стены и проверяем их тип


    f = 1
    return f
    