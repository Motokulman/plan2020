function fundamentRibbonDetails(fundament, fundament_settings, fundament_technology_settings) { // для ускорения расчетов можно ввести расчет стоимости фундамента в функцию получения фундамента, чтоб делапть в одном цикле. Но пока так, дальше видно будет
    var square = 0;
    var volume = 0;
    var piles = 0;
    var conus = 0;
    var knots = 0; // кол-во узлов для связывания каркасов
    var one_knot_wire_weight = 0.005; // масса проволоки для одного узла, кг
    // var grillage_reinforce_length = 0;
    var grillage_reinforce_pieces = 0;
    var cages_reinforce_1_5m_count = 0; // количество хомутов, для изготовления которых достаточно 1,5 метровых отрезков
    var cages_reinforce_2m_count = 0; // количество хомутов, для изготовления которых достаточно 2 метровых отрезков
    var cages_reinforce_3m_count = 0; // количество хомутов, для изготовления которых достаточно 3 метровых отрезков
    for (line of fundament.values()) {// перебираем все элементы 
        var line_length = lengthLine(line.point0, line.point0);
        var line_square = line_length * line.width;
        square = square + line_square;
        volume = square * fundament_settings.grillage_height;
        // посчитаем общую длину арматуры в данной линии. Пока захардкодим настройки
        var num_cages = Math.ceil((line_length - fundament_technology_settings.cage_length) / (fundament_technology_settings.cage_length - fundament_technology_settings.overlap_length)) + 1; // кол-во каркасов длиной по 3,9м на данном участке
        var num_clamps = num_cages * Math.ceil(fundament_technology_settings.cage_length / fundament_technology_settings.cage_clamp_span);// посчитаем кол-во хомутов, пока не зная каких размеров, исходя из того, что на один каркас длиноё 3,9м ставится 9 хоиутов
        // теперь посчитаем кол-во рабочей арматуры ростверка и круга для хомутов исходя из ширины ростверка
        if (width <= 400) {
            grillage_reinforce_pieces = grillage_reinforce_pieces + num_cages * settings.width400_reinforce_pieces;
            cages_reinforce_1_5m_count = cages_reinforce_1_5m_count + num_clamps;
            knots = knots + num_clamps * settings.width400_reinforce_pieces;
        } else if (width <= 500) {
            grillage_reinforce_pieces = grillage_reinforce_pieces + num_cages * settings.width500_reinforce_pieces;
            cages_reinforce_1_5m_count = cages_reinforce_1_5m_count + num_clamps;
            knots = knots + num_clamps * settings.width500_reinforce_pieces;
        } else if (width <= 600) {
            grillage_reinforce_pieces = grillage_reinforce_pieces + num_cages * settings.width600_reinforce_pieces;
            cages_reinforce_2m_count = cages_reinforce_2m_count + num_clamps;
            knots = knots + num_clamps * settings.width600_reinforce_pieces;
        } else {
            grillage_reinforce_pieces = grillage_reinforce_pieces + num_cages * settings.width800_reinforce_pieces;
            cages_reinforce_3m_count = cages_reinforce_3m_count + num_clamps;
            knots = knots + num_clamps * settings.width800_reinforce_pieces;
        }
        // посчитаем кол-во свай на данном участке 
        if (typeof (fundament_settings.piles_span) != "undefined") {
            piles = piles + Math.ceil(line_length / fundament_settings.piles_span);
        }
        // посчитаем кол-во трубок на данном участке 
        var pipes_detail_pics = 2 * line_length / fundament_technology_settings.pipes_span; // это кол-во отрезков трубок. Кстати, если его умножить на 2 получится кол-во конусов
        conus = conus + pipes_detail_pics * 2;
        // посчитаем кол-во трехметровых трубок, по простому
        pipes = Math.ceil((pipes_detail_pics * line.width) / 3);

    } // конец перебора
    if ((typeof (fundament_settings.piles_count) != "undefined")) { // если кол-во свай задано явно
        if (fundament_settings.piles_count != 0) { // если свай больше 0
            piles = fundament_settings.piles_count;
        } else { // если свай нет (=0)
            piles = 0;
        }
    } // если кол-во свай явно не задано, то включаем в результат посчитаное нами значение

    // выдадим состав материалов
    var result = {
        grillage_reinforce_pieces: grillage_reinforce_pieces,
        cages_reinforce_1_5m_count: cages_reinforce_1_5m_count,
        cages_reinforce_2m_count: cages_reinforce_2m_count,
        cages_reinforce_3m_count: cages_reinforce_3m_count,
        piles_reinforce_pieces: piles * fundament_technology_settings.pile_reinforce_pieces,
        piles: piles,
        square: square,
        volume: volume,
        pipes_packs: Math.ceil(pipes / 40),
        conus_packs: Math.ceil(conus / 1500),
        wire: Math.ceil(one_knot_wire_weight * knots),
        knots: knots    
    }
    return result;
}