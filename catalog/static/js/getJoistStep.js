// Функция расчета шага между стропилами кровли

function getJoistStep(b, h, l, sort, Q) { // Q - нагрузка на квадратный метр кровли, а не на метр стропила
    Rbend = 0; // расчетное сопротивление изгибу
    Rchip = 0; // расчтеное сопротивление сколу
    m = 0.4488; // произведение всех актуальных коэффициентов
    step_min = 0; // искомый минимальный шаг между стропилами
    step_bend = 0; // шаг, зависящий от расчета на изгиб
    step_chip = 0; // шагн, зависящий от расчета на скалывание
    step_flexure = 0; // шаг, зависящий от прогиба

    // определим расчетное сопротивление на изгиб исходя из сорта древесины
    if (sort == 1) {
        Rbend = 21;
        Rchip = 2.7;
    } else if (sort == 2) {
        Rbend = 19.5;
        Rchip = 2.4;
    } else if (sort == 3) {
        Rbend = 13;
        Rchip = 2.4;
    }
    Rbend = Rbend * m;
    Rchip = Rchip * m;

    // определим минимальный шаг исходя из расчета на изгиб
    step_bend = (3 * Q * l * l) / (4 * Rbend * b * h);

    // определим минимальный шаг из расчета на скалывание
    step_chip = (3 * Q * l) / (4 * Rchip * b * h);

    step_min = Math.min(step_bend, step_chip); // берем минимальный шаг

    // проверяем на прогиб
    step_flexure = (Q * l * l * l) / (3200 * b * h);

    step_min = Math.min(step_flexure, step_min); // берем минимальный шаг

    return step_min;

}