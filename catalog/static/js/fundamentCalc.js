/*
Для корректной работы расчета фундамента целесообразно будет генерировать отдельно схему для фундамента с указанием нагрузок, как равномерных, так и точечных.
Схема фундамента генерируется после ввода всего проекта: стен, перекрытий, кровли, проемов
При этом определить и записать в каждую линию фундамента:

1) есть ли у этой линии симметричная сторона для приложения нагрузки, то есть сторона, параллельная ей и опирающаяся на существкющую несущую стену. 
Например, a и b. Это только для прямоугольных перекрытий.
2) для каждой линии посчитать кол-во квадратных метров перекрытия, приходящихся на 1 метр данной линии для двух случаев:
- при равноопорном опирании - только на те стороны, которые опираются на 
Для всего перекрытия в целом: является ли оно прямоугольным. 

Короче, чето слишком сложно для первой версии. Возьмем посчитаем общую массу дома и разделим на общий метраж несущих стен, получим нагрузку, исходя из которой все и посчитаем.
Однако, даже для этого следует для каждого перекрытия сохранить не только его этаж, но и является ли оно прямоугольным,
так как при выборе типа перекрытий "поиты ПК" не прямоугольные участки считаются как монолитные.

*/

// зададим дефолтные настройки конструкции ростверков. 
var grillageConstructionDefaultSettings = {
    reinforcing: [
        { width: 400, reinforcingCount: 3, reinforcingDiameter: 12, As: 3.39 }, // подразумевается, что и сверху и снизу одинаковое количество прутков
        { width: 500, reinforcingCount: 4, reinforcingDiameter: 12, As: 4.52 },
        { width: 650, reinforcingCount: 4, reinforcingDiameter: 12, As: 4.52 }
    ],
    concreteClass: '20', // классы бетона В, а не марки, так как именно для классов указаны нормативные данные
    Rb: 10.4, // формула 2.1 или сразу таблица 2.2 , умноженный на коэффициент 0.9 - при действии только постоянных и длительных нагрузок
    reinforcingClass: 'A400',
    Rs: 355, // табл. 2.6
    h0: 350 // черт. 3.3.
}

// создадим пользовательские настройки конструкции ростверков
var grillageConstructionUserSettings = [];

// пока пользовательские настройки равны дефолтным
grillageConstructionUserSettings = grillageConstructionDefaultSettings;

// Посчитаем массу дома
// Чтобы быстро считать массу (а также цену!) дома, целесообразно хранить в схеме проекта что то типа "материального" образа дома, который представляет собой раскладку по кол-ву материалов дома
// создадим такой тестовый массивчик, который в идеале получать от Евгения
var planVolumes = []; // в принципе, эту же модель можно использовать и для кастома, дополняя ее данными

planVolumes = { // площади стен и другие строительные объемы для быстрого расчета стоимости
    walls: { // площади
        outdoor_living: 300.0,
        outdoor_uninhabited: 100.0,
        partition_living: 400.0, // подрузамевается, что все что не перегородки - несущие стены
        partition_uninhabited: 50.0,
        indoor_living: 50.0,
        indoor_uninhabited: 30.0
    },
    fasade: [
        { id: 0, square: 203.4 },// id зоны фасада, площадь зоны фасада. 
        { id: 3, square: 1234.4 },
        { id: 1, square: 546.4 }
    ],
    roof: 100, // площадь
    lintels: [ // lintel - перемычка в строительном контексте
        [1000, "outdoor_living"], // длина пролета 
        [1200, "outdoor_living"],
        [800, "outdoor_uninhabited"],
        [1800, "indoor_living"],
        [2800, "indoor_uninhabited"]
    ],
    plates: [ // расписать и сохранить здесь конкретные плиты не получится, поскольку мы пока не знаем материал стен, а от этого зависит ширина пролета
        { id: 0, floor: 1, size_0: 3000, size_1: 4000, size_0_able_double_bearing: true, size_0_able_double_bearing: true, square: 12.0 },// id перекрытия, этаж, размер 1 (для прямоугольных), размер 2 (аналогично), возможность опирания на эту стороны только с двух сторон, аналогично, площадь. Если размеров нет, значит непрямоугольная форма
        { id: 3, floor: 1, size_0: null, size_1: null, size_0_able_double_bearing: null, size_0_able_double_bearing: null, square: 8.2 },// это как бы эркер
        { id: 2, floor: 2, size_0: 1200, size_1: 3000, size_0_able_double_bearing: false, size_0_able_double_bearing: true, square: 12.0 }// перекрытие опирается с трех сторон, то есть с одной стороны не имеет опоры - например, где лестница
    ],// теоретически, примерную стоимость с плитами можно было бы вычислит просто по средним ценами
    grillageLength: 45.8, // общая длина ростверка

};

// теперь удельные веса на единицу объема конструкций. 
var constructionsWeights = [];

constructionsWeights = {
    walls: { // веса стен, кг/кв.м.
        outdoor_living: 500,
        outdoor_uninhabited: 600,
        partition_living: 100, // подрузамевается, что все что не перегородки - несущие стены
        partition_uninhabited: 80,
        indoor_living: 300,
        indoor_uninhabited: 400
    },
    fasade: [
        { id: 0, weight: 20.4 },// id зоны фасада, масса  зоны фасада. 
        { id: 3, square: 123.4 },
        { id: 1, square: 54.4 }

    ],
    roof: 300, // со снеговой нагрузкой
    plates: [ // масса за кв.м. каждогоперекрытия. Можно было бы объединить по типам, но тогда придется хранить типы и делать проверку на них
        { id: 0, weight: 500.4 },// id перекрытия, масса за кв.м.
        { id: 3, square: 320.4 },
        { id: 2, square: 800.4 }
    ]

};

function houseWeight(planVolumes, constructionsWeights) {
    var weight = 0;
    // Стены:
    weight = weight + planVolumes.walls.outdoor_living * constructionsWeights.walls.outdoor_living;
    weight = weight + planVolumes.walls.outdoor_uninhabited * constructionsWeights.walls.outdoor_uninhabited;
    weight = weight + planVolumes.walls.partition_living * constructionsWeights.walls.partition_living;
    weight = weight + planVolumes.walls.partition_uninhabited * constructionsWeights.walls.partition_uninhabited;
    weight = weight + planVolumes.walls.indoor_living * constructionsWeights.walls.indoor_living;
    weight = weight + planVolumes.walls.indoor_uninhabited * constructionsWeights.walls.indoor_uninhabited;

    // Фасад:
    for (fas of planVolumes.fasade.values()) { // перебираем все элемента массива площадей областей фасадов
        var id = fas.id; // взяли id
        var square = fas.square; // взяли площадь
        var massa = constructionsWeights.fasade.find(item => item.id == id); // нашли по Id в массиве масс областей фасадов массу квадрата фасада из данной области
        weight = weight + massa * square; // все умножили
    }

    // Перекрытия
    for (plat of planVolumes.plates.values()) { // перебираем все элемента массива площадей областей фасадов
        var id = plat.id; // взяли id
        var square = plat.square; // взяли площадь
        var massa = constructionsWeights.plates.find(item => item.id == id); // нашли по Id в массиве масс областей фасадов массу квадрата фасада из данной области
        weight = weight + massa * square; // все умножили
    }

    // кровля
    weight = weight + planVolumes.roof * constructionsWeights.roof;

    return weight;
}

// Сделаем расчет минимального расстояния исходя из настроек армирования и примерного кол-ва свай

// Допустим, есть такие настройки армирования ростверка:
grillageReinforcing = {
    topReinforcing: 3,
    bottomReinforcing: 3,
}

function grillageStrength(houseWeight, grillageConstructionUserSettings) {
    // посчитаем минимальное расстояние между сваями
    var q = houseWeight / planVolumes.grillageLength;  // найдем равномерно распределенную нагрузку
    // для расчета по-минимуму будем считать, что все ростверки равны минимальному ростверку шириной 400мм.
    var minimalConstructionReinforcement = grillageConstructionUserSettings.find(item => item.width == 400);
    var As = grillageConstructionUserSettings.As;
    var Rs = grillageConstructionUserSettings.Rs;
    var Rb = grillageConstructionUserSettings.Rb;
    var b = minimalConstructionReinforcement.width;
    var h0 = grillageConstructionUserSettings.h0;
    // пошагово посчитаем выраженную из формул величину альфа м:
    var temp = (As * Rs) / (Rb * b * h0);
    temp = 1 - temp;
    temp = Math.pow(temp, 2);
    var Alpha_m = (1 - temp) / 2;
    // момент сил
    var M = Alpha_m * Rb * b * h0 * h0;
    var l = Math.sqrt(8 * M / q);

    return l;
}

