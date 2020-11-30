// структура данных на входе:
var flats = { //  плоские элементы
    [{
        square: 2345,
        {
        thick: 0.02,
        lambda: 0.93
    },
        {
        thick: 0.250,
        lambda: 0.81
    },
    {
        thick: 0.150,
        lambda: 0.045
    },
         }],
    [{
        square: 454,
        {
        thick: 0.020,
        lambda: 2.04
    },
    {
        thick: 0.250,
        lambda: 0.81
    },
    {
        thick: 0.150,
        lambda: 0.045
    },
    }]
};

var linears = { //  Линейные элементы
    [{
        length: 81,
        {
        thick: 0.20,
        lambda: 0.93
    },
        {
        thick: 0.250,
        lambda: 0.81
},
{
        thick: 0.150,
        lambda: 0.045
},
     }],
[{
    length: 340,
    {
    thick: 0.020,
    lambda: 0.93
},
{
    thick: 0.250,
    lambda: 0.81
},
{
    thick: 0.150,
    lambda: 0.045
},
}]
};


var pinpoints = { //  точечные элементы
    [{
        square: 2345,
        {
        thick: 20,
        lambda: 0.93
    },
        {
    thick: 250,
        lambda: 0.81
},
{
    thick: 150,
        lambda: 0.045
},
     }],
[{
    square: 454,
    {
    thick: 20,
    lambda: 0.93
},
{
    thick: 250,
    lambda: 0.81
},
{
    thick: 150,
    lambda: 0.045
},
}]
};


function getFasadeR(flat, linear, pinpoint) {
    R_flat = 0.158; // сопротивление теплопередаче плоских элементов . Заранее присваиваем Коэффициенты теплоотдачи внутренней и внешней поверхности  ограждающей конструкции http://www.kraspan.ru/upload/iblock/447/Energoeffect.pdf таблица 1.1.2 и 1.1.4
    R_linear = 0; // сопротивление теплопередаче Линейных элементов
    R_pinpoint = 0; // сопротивление теплопередаче точечных элементов
    U_flat = [];
    U_linear = [];
    U_pinpoint = [];

    for (flat of flats.values()) { // перебор всех плоских элементов
        for (f of flat.values()) { // перебор внутри конкретного плоского элемента
            R_flat = R_flat + f.thick / f.lambda;
        }
        U_flat = push(1 / R_flat);
    }

    for (linear of linears.values()) { // перебор всех Линейных элементов
        for (l of linear.values()) { // перебор внутри конкретного линейного элемента
            R_linear = R_linear + f.thick / f.lambda;
        }
        U_linear = push(1 / R_linear);
    }

    for (pinpoint of pinpoints.values()) { // перебор всех Линейных элементов
        for (p of pinpoint.values()) { // перебор внутри конкретного линейного элемента
            R_pinpoint = R_pinpoint + f.thick / f.lambda;
        }
        U_pinpoint = push(1 / R_pinpoint);
    }

    return R_flat, R_linear, R_pinpoint, U_flat, U_linear, U_pinpoint;
}