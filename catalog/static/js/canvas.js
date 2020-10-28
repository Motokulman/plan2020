var canvas_0 = document.getElementById('canvas_0'); // канва для рисования схемы
var canvas_1 = document.getElementById('canvas_1'); // канва для линий приклейки
var canvas_2 = document.getElementById('canvas_2'); // канва для размеров
var canvas_3 = document.getElementById('canvas_3'); // канва для подсвечивания выделенного размера
var ctx_0 = canvas_0.getContext('2d');
var ctx_1 = canvas_1.getContext('2d');
var ctx_2 = canvas_2.getContext('2d');
var ctx_3 = canvas_3.getContext('2d');
// https://3dfine.github.io/

var selectedLineType = "straight"; // Тип линии при рисовании - прямая или кривая
var polygonSides = "3"; // Количество сторон многоугольника
var selectedTool = "none"; // Выбранный элемент для рисования, стена, или еще что-то. Изначально - ничего не выбрано
var mousePosArray = []; // массив позиций мыши при рисовании. 
var mousePos; // Позиции мыши по х и у, с учетом положения канвы на экране
var mmOfMousePos = []; // Позиция в миллиметрах, соответствующая текущему положению мыши с учетом смещения и масштаба
var points = []; // Массив точек в миллиметрах. Первая точка - точка отсчета, начало коопдинат
var zeroPointPadding = { 'x': 0, 'y': 0 }; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var lines = []; // Массив связей между точками. 
var elements = []; // Фигура, содержит массив элементов и закон их взаимодействия
var vents = []; // Вентканалы
var windows = []; // Содержит окна в стенах
var balconyGroups = []; // Выход на балкон: окно(а) с дверью 
var openings = []; // Проходные проемы, либо с дверью, либо без
var doors = []; // Дверные проемы
var scale = 25; // Сделать получение из настроек и сохранение в них
var empty_scheme = true;// Правда, если еще нет ни одного элемента в схеме
var sizeTextSettings = { topPadding: 10, bottomPadding: 5, leftPadding: 5, rightPadding: 30 }; // массив с настройками для отображения размеров на  экране
var prePointsMM = []; // массив новых точек при рисовании элемента. Потом добавляется в основной массив точек
var selectedElements = [];// массив выделенных на схеме элементов (id)
var selectedLines = [];// массив выделенных на схеме линий (id)
var selectedPoints = [];// массив выделенных на схеме точек (id)
var schemeChange = false;
var checked = false; // прверен проект или нет
var plate_garage = []; // массив перекрытий гаражного типа, который включает в себя координаты точки в мм внутри поемещения. Сделать проверку, чтоб не было двух таких меток внутри одного помещения и сделать удаление
var drawSettings = [];
var level; // текущий уровень
var roof_point_height = 0; // глобальная переменная для хранения высоты кровельных точек на протяжении всего цикла ввода ската
var bearingOutdoorWidth = 500; // ширина несущей наружной стены
var bearingIndoorWidth = 400; // ширина несущей внутренней стены
var readyForAlignment = false; // когда выбраны две стены для выравнивания по своим сторонам
// var surface = [];  // поверхности стен. Для отрисовки фасада и т.д.
// var volumes = { // площади стен и другие строительные объемы для быстрого расчета стоимости
//     walls: {
//         outdoor: 0,
//         indoor_partition: 0,
//         indoor_bearing: 0
//     },
// };

var levels = new Map([['floor_1', { // настройки уровней
    height: 3000, // высота стены в чистом виле, то есть от белового пола до белового потолка
    insulate: 0, // утеплитель пола
    screed: 70,  // стяжка пола
    plate: 220, // перекрытие
    ceiling: 50, // потолок
    covering: 20 // покрытие пола
}], ['floor_2', {
    height: 3000,
    insulate: 0,
    screed: 70,
    plate: 220,
    ceiling: 50,
    covering: 20
}], ['floor_3', {
    height: 3000,
    insulate: 0,
    screed: 70,
    plate: 220,
    ceiling: 50,
    covering: 20
}]]);


var drawSettingsDefault = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "#00ffff",
    globalAlpha: 1,
    blur: false
}

var drawSettingsGarage = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "lime",
    globalAlpha: 0.5,
    blur: false
}

var drawSettingsOutdoorPlate = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "blue",
    globalAlpha: 0.5,
    blur: false
}
var drawSettingsIndoorPlate = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "green",
    globalAlpha: 0.5,
    blur: false
}

var drawSettingsSteps = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "pink",
    globalAlpha: 0.5,
    blur: false
}

var drawSettingsEntranceGroup = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "GoldenRod",
    globalAlpha: 0.5,
    blur: false
}

var drawSettingsWindow = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "#00ccff",
    globalAlpha: 1,
    blur: false,
    width: 1500,
    height: 1500,
    top: 220, // следует решить, как именно будет вычисляться окно, ведь расстояние от черного потолка до верхнего края окна зависит от толщины перемычки, а она зависит от ширины окна. Если речь идет о стандартных перемычках конечно
    bottom: 800 // расстояние от пола до подоконника
}

var drawSettingsVent = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "lime",
    globalAlpha: 1,
    blur: false,
}

var drawSettingsDoor = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "Brown",
    globalAlpha: 1,
    blur: false,
}
var drawSettingsGray = {
    strokeStyle: 'gray',
    lineWidth: 2,
    fillStyle: "white",
    globalAlpha: 1,
    blur: false,
}
var drawSettingsOpening = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyleDoor: "#8b4513",
    fillStyleEmpty: "white",
    globalAlpha: 1,
    blur: false
}


var drawSettingsDefaultRoof = {
    strokeStyle: 'black',
    lineWidth: 2,
    fillStyle: "#663333",
    globalAlpha: 0.5,
    blur: false,
}
drawSettingsRoof = Object.assign({}, drawSettingsDefaultRoof);

var doorDefault = {
    width: 900,
    height: 2100
}

var openingDefault = {
    width: 1500,
    top: 220 // высота от черного потолка
}

var balconyGroupDefault = {
    firstWindowWidth: 1500, // первое окно считается от первой точки линии p0   
    firstWindowBottom: 800, // расстояние до чистого пола
    secondWindowWidth: 1500, // второе окно через дверь от первого окна
    secondWindowBottom: 800, // расстояние до чистого пола
    doorWidth: 900,
    doorBottom: 100,// высота порога двери от беловой стяжки
    top: 220, // высота от чистого потолка
    doorHeight: 2100
}

var ventDefault = {
    quantity: 3 // количество вентканалов

}



// рисуем точку
function drawPoint(p, color, diameter) {
    var d;
    ctx_0.fillStyle = typeof color != 'undefined' ? color : 'black';
    d = typeof diameter != 'undefined' ? diameter : 5;
    ctx_0.beginPath();
    ctx_0.arc(p.x, p.y, d, 0, 2 * Math.PI);
    ctx_0.fill();
    ctx_0.closePath();
}

function drawShape(element, context, drawSettings) {
    //   ////console.log("drawSettings = ", drawSettings);
    // var ctx = context;
    var line = [];
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.fillStyle = drawSettings.fillStyle;
    context.globalAlpha = drawSettings.globalAlpha;
    // ////console.log("drawSettings.blur = ", drawSettings.blur);
    if (selectedElements.find(sel => sel == element.id) >= 0) { // если данный элемент в массиве выделенных
        context.shadowBlur = 30;
        context.shadowColor = "black";
    } else {
        context.shadowBlur = 0;
    }
    context.beginPath();
    // найдем первую точку
    line = lines.find(line => line.id == element.ids[0]);
    context.moveTo(mmToPix(points.find(point => point.id == line.id0)).x, mmToPix(points.find(point => point.id == line.id0)).y);
    // ////console.log("delement.ids.values() = ", element.ids.values());
    for (line_id of element.ids.values()) {
        // ////console.log("line_id= ", line_id);
        line = lines.find(line => line.id == line_id);
        var point0 = mmToPix(points.find(point => point.id == line.id0));
        var point1 = mmToPix(points.find(point => point.id == line.id1));
        if (line.distance > 0) {// если это окружность
            // ////console.log("окружность ");
            var middle = [];
            middle.x = Math.min(point0.x, point1.x) + Math.abs(point0.x - point1.x) / 2;
            middle.y = Math.min(point0.y, point1.y) + Math.abs(point0.y - point1.y) / 2;
            var radius = lengthLine(point0, point1) / 2;
            if (point0.y == point1.y) {
                if (((line.direction == "left") && (point0.x < point1.x))) {
                    context.arc(middle.x, middle.y, radius, 0, Math.PI, true);
                } else if (((line.direction == "right") && (point0.x < point1.x))) {
                    context.arc(middle.x, middle.y, radius, 0, Math.PI, false);
                } else if (((line.direction == "left") && (point0.x > point1.x))) {
                    context.arc(middle.x, middle.y, radius, Math.PI, 0, true);
                } else if (((line.direction == "right") && (point0.x > point1.x))) {
                    context.arc(middle.x, middle.y, radius, Math.PI, 0, false);
                }
            } else if (point0.x == point1.x) {
                if (((line.direction == "left") && (point0.y < point1.y))) {
                    context.arc(middle.x, middle.y, radius, Math.PI / 2, 3 * Math.PI / 2, true);
                } else if (((line.direction == "right") && (point0.y < point1.y))) {
                    context.arc(middle.x, middle.y, radius, Math.PI / 2, 3 * Math.PI / 2, false);
                } else if (((line.direction == "right") && (point0.y > point1.y))) {
                    context.arc(middle.x, middle.y, radius, 3 * Math.PI / 2, Math.PI / 2, false);
                } else if (((line.direction == "left") && (point0.y > point1.y))) {
                    context.arc(middle.x, middle.y, radius, 3 * Math.PI / 2, Math.PI / 2, true);
                }
            }
        } else { // если это не окружность, значит это просто прямая
            // context.moveTo(point0.x, point0.y);
            context.lineTo(point1.x, point1.y);
            // ////console.log("element= ", element);
            // ////console.log("lineTo= ", point1);
        }
    }
    context.fill();
    context.stroke();
    for (line_id of element.ids.values()) {
        line = lines.find(line => line.id == line_id);
        drawLine(line, context, drawSettings);
    }
}

// рисуем линию, в зависимости от содержимого прямую или кривую
function drawLine(line, context, drawSettings) {

    // ////console.log("line = ", line);
    // context.strokeStyle = drawSettingsDefault.strokeStyle;
    // context.lineWidth = drawSettingsDefault.lineWidth;

    context.lineWidth = drawSettings.lineWidth;
    // ////console.log("selectedLines = ", selectedLines);
    // ////console.log("selectedLines.findIndex(sel => sel == line.id) = ", selectedLines.findIndex(sel => sel == line.id));
    if (selectedLines.findIndex(sel => sel == line.id) >= 0) { // если данный элемент в массиве выделенных typeof line != "undefined")
        context.strokeStyle = 'lime';
    } else {
        context.strokeStyle = drawSettings.strokeStyle;
    }

    context.beginPath();
    // найдем первую точку
    // line = lines.find(line => line.id == element.ids[0]);
    // context.moveTo(mmToPix(points.find(point => point.id == line.id0)).x, mmToPix(points.find(point => point.id == line.id0)).y);
    var point0 = mmToPix(points.find(point => point.id == line.id0));
    var point1 = mmToPix(points.find(point => point.id == line.id1));
    if (line.distance > 0) {// если это окружность
        var middle = [];
        middle.x = Math.min(point0.x, point1.x) + Math.abs(point0.x - point1.x) / 2;
        middle.y = Math.min(point0.y, point1.y) + Math.abs(point0.y - point1.y) / 2;
        var radius = lengthLine(point0, point1) / 2;
        if (point0.y == point1.y) {
            if (((line.direction == "left") && (point0.x < point1.x))) {
                context.arc(middle.x, middle.y, radius, 0, Math.PI, true);
            } else if (((line.direction == "right") && (point0.x < point1.x))) {
                context.arc(middle.x, middle.y, radius, 0, Math.PI, false);
            } else if (((line.direction == "left") && (point0.x > point1.x))) {
                context.arc(middle.x, middle.y, radius, Math.PI, 0, true);
            } else if (((line.direction == "right") && (point0.x > point1.x))) {
                context.arc(middle.x, middle.y, radius, Math.PI, 0, false);
            }
        } else if (point0.x == point1.x) {
            if (((line.direction == "left") && (point0.y < point1.y))) {
                context.arc(middle.x + 0.5, middle.y + 0.5, radius, Math.PI / 2, 3 * Math.PI / 2, true);
            } else if (((line.direction == "right") && (point0.y < point1.y))) {
                context.arc(middle.x + 0.5, middle.y + 0.5, radius, Math.PI / 2, 3 * Math.PI / 2, false);
            } else if (((line.direction == "right") && (point0.y > point1.y))) {
                context.arc(middle.x + 0.5, middle.y + 0.5, radius, 3 * Math.PI / 2, Math.PI / 2, false);
            } else if (((line.direction == "left") && (point0.y > point1.y))) {
                context.arc(middle.x + 0.5, middle.y + 0.5, radius, 3 * Math.PI / 2, Math.PI / 2, true);
            }
        }
    } else if (lengthLine(point0, point1) == 0) { // если это не окружность, значит это просто прямая. Если ее длина == 0, то это колонна
        context.moveTo(point0.x - 3, point0.y);
        context.lineTo(point1.x + 3, point1.y);
        context.moveTo(point0.x, point0.y + 3);
        context.lineTo(point1.x, point1.y - 3);
    } else { // иначе это просто прямая
        context.moveTo(point0.x, point0.y);
        context.lineTo(point1.x, point1.y);
    }
    // ////console.log("context = ", context);
    context.stroke();

    // отрисуем окна на этой линии
    if (typeof windows != "undefined") {
        for (item of windows.values()) {
            // ////console.log("item = ", item);
            if (item.line_id == line.id) {
                var x, y;
                var L = lengthLine(point0, point1);
                var rate = item.distance / scale;
                rate = rate / L;
                x = Math.abs((point0.x - point1.x)) * rate;
                y = Math.abs((point0.y - point1.y)) * rate;
                if (point0.x <= point1.x) {
                    x = x + point0.x;
                } else {
                    x = point0.x - x;
                }
                if (point0.y <= point1.y) {
                    y = y + point0.y;
                } else {
                    y = point0.y - y;
                }
                drawWindow(x, y, ctx_0, drawSettingsWindow);
            }
        }
    }
    // отрисуем doow windows на этой линии
    if (typeof balconyGroups != "undefined") {
        for (item of balconyGroups.values()) {
            // ////console.log("item = ", item);
            if (item.line_id == line.id) {
                var x, y;
                var L = lengthLine(point0, point1);
                var rate = item.distance / scale;
                rate = rate / L;
                x = Math.abs((point0.x - point1.x)) * rate;
                y = Math.abs((point0.y - point1.y)) * rate;
                if (point0.x <= point1.x) {
                    x = x + point0.x;
                } else {
                    x = point0.x - x;
                }
                if (point0.y <= point1.y) {
                    y = y + point0.y;
                } else {
                    y = point0.y - y;
                }
                drawBalconyGroup(x, y, ctx_0, drawSettingsWindow);
            }
        }
    }
    // отрисуем vent на этой линии
    if (typeof vents != "undefined") {
        for (item of vents.values()) {
            // ////console.log("item = ", item);
            if (item.line_id == line.id) {
                var x, y;
                var L = lengthLine(point0, point1);
                var rate = item.distance / scale;
                rate = rate / L;
                x = Math.abs((point0.x - point1.x)) * rate;
                y = Math.abs((point0.y - point1.y)) * rate;
                if (point0.x <= point1.x) {
                    x = x + point0.x;
                } else {
                    x = point0.x - x;
                }
                if (point0.y <= point1.y) {
                    y = y + point0.y;
                } else {
                    y = point0.y - y;
                }
                drawVent(x, y, ctx_0, drawSettingsVent);
            }
        }
    }
    // отрисуем openings на этой линии
    if (typeof openings != "undefined") {
        for (item of openings.values()) {
            // ////console.log("item = ", item);
            if (item.line_id == line.id) {
                var x, y;
                var L = lengthLine(point0, point1);
                var rate = item.distance / scale;
                rate = rate / L;
                x = Math.abs((point0.x - point1.x)) * rate;
                y = Math.abs((point0.y - point1.y)) * rate;
                if (point0.x <= point1.x) {
                    x = x + point0.x;
                } else {
                    x = point0.x - x;
                }
                if (point0.y <= point1.y) {
                    y = y + point0.y;
                } else {
                    y = point0.y - y;
                }
                drawOpening(x, y, ctx_0, drawSettingsOpening);
            }
        }
    }
    // отрисуем doors на этой линии
    if (typeof doors != "undefined") {
        for (item of doors.values()) {
            // ////console.log("item = ", item);
            if (item.line_id == line.id) {
                var x, y;
                var L = lengthLine(point0, point1);
                var rate = item.distance / scale;
                rate = rate / L;
                x = Math.abs((point0.x - point1.x)) * rate;
                y = Math.abs((point0.y - point1.y)) * rate;
                if (point0.x <= point1.x) {
                    x = x + point0.x;
                } else {
                    x = point0.x - x;
                }
                if (point0.y <= point1.y) {
                    y = y + point0.y;
                } else {
                    y = point0.y - y;
                }
                drawDoor(x, y, ctx_0, drawSettingsDoor);
            }
        }
    }
}


function drawWindow(x, y, context, drawSettings) {
    // ////console.log("drawShape element = ", element);
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.fillStyle = drawSettings.fillStyle;
    context.globalAlpha = drawSettings.globalAlpha;
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }

    context.beginPath();
    context.moveTo(x - 10, y - 10);
    context.lineTo(x + 10, y - 10);
    context.lineTo(x + 10, y + 10);
    context.lineTo(x - 10, y + 10);
    context.closePath();
    context.stroke();
    context.fill();
}

function drawOpening(x, y, context, drawSettings) {
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.globalAlpha = drawSettings.globalAlpha;
    if (drawSettings.empty == true) {
        context.fillStyle = drawSettings.fillStyleEmpty;
    } else {
        context.fillStyle = drawSettings.fillStyleDoor;
    }
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }

    context.beginPath();
    context.moveTo(x - 5, y - 10);
    context.lineTo(x + 5, y - 10);
    context.lineTo(x + 5, y + 10);
    context.lineTo(x - 5, y + 10);
    context.closePath();
    context.stroke();
    context.fill();
}

function drawDoor(x, y, context, drawSettings) {
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.globalAlpha = drawSettings.globalAlpha;
    if (drawSettings.empty == true) {
        context.fillStyle = drawSettings.fillStyleEmpty;
    } else {
        context.fillStyle = drawSettings.fillStyleDoor;
    }
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }

    context.beginPath();
    context.moveTo(x - 5, y - 10);
    context.lineTo(x + 5, y - 10);
    context.lineTo(x + 5, y + 10);
    context.lineTo(x - 5, y + 10);
    context.closePath();
    context.stroke();
    context.fill();
}
function drawBalconyGroup(x, y, context, drawSettings) {
    // ////console.log("drawShape element = ", element); drawBalconyGroup
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.fillStyle = drawSettings.fillStyle;
    context.globalAlpha = drawSettings.globalAlpha;
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }
    context.beginPath();
    context.moveTo(x - 16, y - 10);
    context.lineTo(x - 5, y - 10);
    context.lineTo(x - 5, y + 2);
    context.lineTo(x - 16, y + 2);
    context.closePath();
    context.stroke();
    context.fill();

    context.beginPath();
    context.moveTo(x - 5, y - 10);
    context.lineTo(x + 5, y - 10);
    context.lineTo(x + 5, y + 10);
    context.lineTo(x - 5, y + 10);
    context.closePath();
    context.stroke();
    context.fill();

    context.beginPath();
    context.moveTo(x + 6, y - 10);
    context.lineTo(x + 16, y - 10);
    context.lineTo(x + 16, y + 2);
    context.lineTo(x + 6, y + 2);
    context.closePath();
    context.stroke();
    context.fill();

}

function drawVent(x, y, context, drawSettings) {
    // ////console.log("drawShape element = ", element);
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.fillStyle = drawSettings.fillStyle;
    context.globalAlpha = drawSettings.globalAlpha;
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "green";
    }
    context.beginPath();
    context.moveTo(x - 16, y - 10);
    context.lineTo(x - 5, y - 10);
    context.lineTo(x - 5, y + 2);
    context.lineTo(x - 16, y + 2);
    context.closePath();
    context.stroke();
    context.fill();

    context.beginPath();
    context.moveTo(x - 5, y - 10);
    context.lineTo(x + 5, y - 10);
    context.lineTo(x + 5, y + 10);
    context.lineTo(x - 5, y + 10);
    context.closePath();
    context.stroke();
    context.fill();

    context.beginPath();
    context.moveTo(x + 6, y - 10);
    context.lineTo(x + 16, y - 10);
    context.lineTo(x + 16, y + 2);
    context.lineTo(x + 6, y + 2);
    context.closePath();
    context.stroke();
    context.fill();

}


function drawElement(element) {
    // console.log('element = ', element);
    drawSettings = drawSettingsDefault;
    var draw_it = false;
    if (element.type == 'wall') { // если это стена
        if (selectedElements.findIndex(sel => sel == element.id)) { // если данный элемент в массиве выделенных
            drawSettings.blur = true;
        } else {
            drawSettings.blur = false;
        }
        if (element.subType.indexOf("partition") >= 0) {// если это перегородка
            if (element.limitation > level) { // если стены не ограничены текущим уровнем, то рисуем нормально
                drawSettings = {
                    lineWidth: 6,
                    strokeStyle: "black"
                }
                draw_it = true;
            } else if (element.limitation == level) { // если стены ограничены текущим уровнем, то их рисуем серым. Если ограничены уровнем ниже, то вовсе не рисуем
                drawSettings = {
                    lineWidth: 6,
                    strokeStyle: "gray"
                }
                draw_it = true;
            }
            if (draw_it == true) { // рисуем только не ограниченные текущим уровнем и серым, если ограничены текущим. Все что ниже не рисуем
                for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                    var line = lines.find(line => line.id == line_id);
                    drawLine(line, ctx_0, drawSettings);
                }
            }
            draw_it = false;
        } else if (element.subType.indexOf("bearing") >= 0) {// если это несущая стена 
            if (element.limitation > level) {
                drawSettings = {
                    lineWidth: 12,
                    strokeStyle: "black"
                }
                draw_it = true;
            } else if (element.limitation == level) { // if (level != "floor_1")
                drawSettings = {
                    lineWidth: 12,
                    strokeStyle: "gray"
                }
                draw_it = true;
            }
            if (draw_it == true) {
                for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                    var line = lines.find(line => line.id == line_id);
                    drawLine(line, ctx_0, drawSettings);
                }
            }
            draw_it = false;
            if (element.limitation > level) {
                if (element.subType.indexOf("outdoor") >= 0) {
                    drawSettings = {
                        lineWidth: 10,
                        strokeStyle: "yellow"
                    }
                } else if (element.subType.indexOf("indoor") >= 0) {
                    drawSettings = {
                        lineWidth: 10,
                        strokeStyle: "blue"
                    }
                }
                for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                    var line = lines.find(line => line.id == line_id);
                    drawLine(line, ctx_0, drawSettings);
                }
            }

        } else {
            drawSettings = drawSettingsDefault; // задаем умолчания, если тип стены еще не задан
            for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                var line = lines.find(line => line.id == line_id);
                drawLine(line, ctx_0, drawSettings);
            }
        }
        if (element.limitation > level) {
            if (element.subType.indexOf("living") >= 0) {// если это смженая сжилым
                drawSettings = {
                    lineWidth: 4,
                    strokeStyle: "green"
                }
                for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                    var line = lines.find(line => line.id == line_id);
                    drawLine(line, ctx_0, drawSettings);
                }
            } else if (element.subType.indexOf("uninhabited") >= 0) {// если это смженая с нежилым
                drawSettings = {
                    lineWidth: 4,
                    strokeStyle: "gray"
                }
                for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                    var line = lines.find(line => line.id == line_id);
                    drawLine(line, ctx_0, drawSettings); // нарисовали линию стены
                }
            }
        }



    } else if (element.type == 'aperture') { // если это лестничный пролет drawSettingsGarage
        drawShape(element, ctx_0, drawSettingsDefault);
    } else if ((element.type == 'floor') && (element.subType == 'garage')) { // если это пол гаража 
        drawShape(element, ctx_0, drawSettingsGarage);
    } else if (element.type == 'roof') { // если это кровля
        drawShape(element, ctx_0, drawSettingsRoof);
        // ////console.log("drawSettingsGarage == ", drawSettingsGarage)
        // } else if ((element.type == 'roof') && (element.level == level)) {
        //     if ((element.highSide != '') && (element.angle != 0) && (element.height != 0)) { // если еще не заданы настройки крыши, даем эо понять цветом
        //         drawSettings = {
        //             fillStyle: 'red',
        //             globalAlpha: 0.5
        //         }
        //     } else {
        //         drawSettings = {
        //             fillStyle: 'gray',
        //             globalAlpha: 0.5
        //         }
        //     }
        //     drawShape(element, ctx_0, drawSettings);
    } else if ((element.type == 'indoor_plate') && (element.level == level)) {
        drawShape(element, ctx_0, drawSettingsIndoorPlate);
    } else if ((element.type == 'outdoor_plate') && (element.level == level)) {
        drawShape(element, ctx_0, drawSettingsOutdoorPlate);
    } else if ((element.type == 'steps') && (element.level == level)) {
        drawShape(element, ctx_0, drawSettingsSteps);
    } else if (element.type == 'entrance_group') {
        if (element.level == level) {
            drawShape(element, ctx_0, drawSettingsEntranceGroup);
        } else if (element.level < level) {
            drawShape(element, ctx_0, drawSettingsGray);
        }
    }
}



// Воспроизведение из массива стен
function drawElements() {  //drawWalls
    // readyForDefineFasadeSide(elements);
    // console.log("elements[0] = ", elements[0] );
    clear(ctx_0, canvas_0);
    if (elements.length > 0) {
        for (element of elements.values()) {// перебираем все элементы 
            if (((element.type == "wall") && (level == 1) && (element.level == 1)) || ((element.type == "wall") && (level == 2)) || ((element.type == "wall") && (level == 3)) || (element.type != "wall")) {
                drawElement(element);
            }
        }
        if (selectedPoints.length > 0) { // если имеем в массиве выбранный точки, пока только это м.б. кровельные, рисуем их разным цветом
            for (i = 0; i < selectedPoints.length; i++) {
                var p = mmToPix(points.find(point => point.id == selectedPoints[i]));
                if (i == 0) drawPoint(p, 'yellow', 10);
                if (i == 1) drawPoint(p, 'red', 10);
                if (i > 1) drawPoint(p, 'blue', 10);
            }
        }
        if (selectedElements.length > 0) { // проверяем наличие выбранных элементов
            for (i = 0; i < selectedElements.length; i++) {
                var e = elements.find(element => element.id == selectedElements[i]);
                if (e.type == "roof") {// если это скат кровли
                    if (i == 0) {
                        drawSettingsRoof.strokeStyle = "yellow";
                        drawShape(e, ctx_0, drawSettingsRoof);
                        drawSettingsRoof = Object.assign({}, drawSettingsDefaultRoof);
                    } else {
                        drawShape(e, ctx_0, drawSettingsRoof);
                    }
                }
            }
        }
    }
}



// попробуем создать модальное окно для стен https://professorweb.ru/my/javascript/jquery/level4/4_9.php
$(function () {
    $('#wall_dialog').dialog({
        buttons: [{ text: "OK", click: applyWallData }, { text: "Отмена", click: function () { $(this).dialog("close") } }],
        modal: true,
        autoOpen: false,
        width: 340
    })
});

// создаем модальное окно для кровли

function createRoofModalDialog() {
    $(function () {
        $('#roof_dialog > p').remove();
        $('#roof_dialog > h3').remove();
        // var is_equal = true;
        // var roof_points = [];
        // var roof_point = points.find(point => point.id == selectedPoints[0]); // возьмем первую точку из массива выбранных линий
        // var is_floor_1 = roof_point.is_floor_1;
        // var is_floor_2 = roof_point.is_floor_2;
        // var is_floor_3 = roof_point.is_floor_3;
        // var height = roof_point.height;
        // ////console.log("roof_point = ", roof_point);

        if (selectedPoints.length > 0) { // если выбрана хоть одна точка
            $('#roof_dialog').append('<p><label><input type="checkbox" id="is_floor_1"  />Высота 1 этажа</label></p>');
            $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_2"  />Высота 2 этажа</label></p>');
            $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_3" />Высота 3 этажа</label></p>');

            $('#roof_dialog').append('<h3>Желтая точка:</h3>');
            $('#roof_dialog').append('<p><label><input type="number" id="0_height" name="0_height" min="-3000" max="8000" value="0">Добавочная высота</label></p>');
            if (selectedPoints.length > 1) { // если выбрано 2 и более точек
                $('#roof_dialog').append('<h3>Красная точка:</h3>');
                $('#roof_dialog').append('<p><label><input type="number" id="1_height" name="1_height" min="-3000" max="8000" value="0">Добавочная высота</label></p>');
            }
            if (selectedPoints.length > 2) { // если выбрано 3 и более точек
                $('#roof_dialog').append('<h3>Синяя точка:</h3>');
                $('#roof_dialog').append('<p><label><input type="number" id="2_height" name="2_height" min="-3000" max="8000" value="0">Добавочная высота</label></p>');
            }
            $('#roof_dialog').dialog({
                buttons: [{ text: "OK", click: applyRoofData }, { text: "Отмена", click: function () { $(this).dialog("close") } }],
                modal: true,
                autoOpen: false,
                width: 340
            })

        } else if (selectedElements.length == 2) {
            $('#roof_dialog').dialog({
                buttons: [{ text: "Уравнять смежные", click: setSameData }, { text: "Отмена", click: function () { $(this).dialog("close") } }],
                modal: true,
                autoOpen: false,
                width: 340
            })
        }// if если выбрана хоть одна точка




        // for (sl of selectedPoints.values()) { // проверяем, совпадают ли высоты выбранных линий
        //     var p = points.find(point => point.id == sl);
        //     if (p.is_floor_1 != is_floor_1) is_equal = false;
        //     if (p.is_floor_2 != is_floor_2) is_equal = false;
        //     if (p.is_floor_3 != is_floor_3) is_equal = false;
        //     if (p.height != height) is_equal = false;
        // }
        // if (is_equal) { // если высоты всех точк одинаковые
        //     if ((!is_floor_1) && (!is_floor_2) && (!is_floor_3)) {
        //         $('#roof_dialog').append('<p><label><input type="checkbox" id="is_floor_1"  name="is_floor_1" />Высота 1 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_2"  name="is_floor_2" />Высота 2 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_3"  name="is_floor_3" />Высота 3 этажа</label></p>');
        //         // $('#is_floor_1').prop('checked', true);

        //     } else if ((is_floor_1) && (!is_floor_2) && (!is_floor_3)) {
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_1" checked name="is_floor_1" />Высота 1 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_2"  name="is_floor_2" />Высота 2 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_3"  name="is_floor_3" />Высота 3 этажа</label></p>');
        //     } else if ((is_floor_1) && (is_floor_2) && (!is_floor_3)) {
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_1" checked name="is_floor_1" />Высота 1 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_2" checked name="is_floor_2" />Высота 2 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_3"  name="is_floor_3" />Высота 3 этажа</label></p>');
        //     } else if ((is_floor_1) && (is_floor_2) && (is_floor_3)) {
        //         $('#roof_dialog').append('<p><label><input type="checkbox" id="is_floor_1" checked name="is_floor_1" />Высота 1 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_2" checked name="is_floor_2" />Высота 2 этажа</label></p>');
        //         $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_3" checked name="is_floor_3" />Высота 3 этажа</label></p>');
        //     }
        //     $('#roof_dialog').append('<p><label><input type="number" id="height" name="height" min="-3000" max="8000" value="' + height + '">Добавочная высота</label></p>');
        // } else {
        //     $('#roof_dialog').append('<p>Выбранные точки имеют разные высоты</p>');
        //     $('#roof_dialog').append('<p><label><input type="checkbox" id="is_floor_1"  name="is_floor_1" />Высота 1 этажа</label></p>');
        //     $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_2"  name="is_floor_2" />Высота 2 этажа</label></p>');
        //     $('#roof_dialog').append('<p><label><input type="checkbox"  id="is_floor_3"  name="is_floor_3" />Высота 3 этажа</label></p>');
        //     $('#roof_dialog').append('<p><label><input type="number" id="height" name="height" min="-3000" max="8000" value="0">Добавочная высота</label></p>');
        // }



    });
}
// обработка правого клика
$("#stage").bind('contextmenu', function (e) {
    // $('#wall_dialog').dialog("open");
    if (selectedElements.length > 0) {
        var num = 0;
        var type = '';
        // проверяем, выбранные элементы одного ли типа, и если да, определяем этот тип и вызываем соответствующее диалоговое окно
        for (sel of selectedElements.values()) {
            for (el of elements.values()) {
                if (el.id == sel) {
                    if (type == '') {
                        type = el.type;
                        num++;
                    } else {
                        if (el.type == type) {
                            num++;
                        }
                    }
                }
            }
        }
        if (selectedElements.length == num) {
            // ////console.log('type  = ', type);
            switch (type) {
                case 'wall':
                    // ////console.log("num = ", num);
                    $('#wall_dialog').dialog("open");
                    break;
                case 'roof':
                    ////console.log("roof r.cl = ");
                    createRoofModalDialog();
                    $('#roof_dialog').dialog("open");
                    break;
            }
        }

    }
    return false;// запрет стандартного окна при правом клике, нам ведь нужно наше окно
});

// добавление данных о стенах
function applyWallData() {
    var bearType = $('input[name=wall_type]:checked').val();
    var liveType = $('input[name=living]:checked').val();
    var outdoorType = $('input[name=outdoor]:checked').val();
    for (sel of selectedElements.values()) {
        for (el of elements.values()) {
            if (el.id == sel) {
                // //////console.log("sel = ", sel);
                var a = bearType + "_" + liveType;
                if (bearType == "bearing") {
                    a = a + "_" + outdoorType;
                }
                el.subType = a;
            }
        }
    }
    $('#wall_dialog').dialog("close");
    selectedElements = [];
    schemeChange = true;
    drawElements();
    // ////console.log("elements = ", elements);
}
// добавление данных о кровле
function applyRoofData() {

    var point = [];
    if (selectedPoints.length > 0) {
        point = points.find(point => point.id == selectedPoints[0]);
        point.is_floor_1 = $('#is_floor_1').is(':checked');
        point.is_floor_2 = $('#is_floor_2').is(':checked');
        point.is_floor_3 = $('#is_floor_3').is(':checked');
        point.height = parseInt($('input[name=0_height]').val());
    }

    if (selectedPoints.length > 1) {
        point = points.find(point => point.id == selectedPoints[1]);
        point.is_floor_1 = $('#is_floor_1').is(':checked');
        point.is_floor_2 = $('#is_floor_2').is(':checked');
        point.is_floor_3 = $('#is_floor_3').is(':checked');
        point.height = parseInt($('input[name=1_height]').val());
    }
    if (selectedPoints.length == 3) {
        point = points.find(point => point.id == selectedPoints[2]);
        point.is_floor_1 = $('#is_floor_1').is(':checked');
        point.is_floor_2 = $('#is_floor_2').is(':checked');
        point.is_floor_3 = $('#is_floor_3').is(':checked');
        point.height = parseInt($('input[name=2_height]').val());
    }
    $('#roof_dialog').dialog("close");
    calculateRoofPointsHeights(selectedPoints, selectedElements);
    selectedElements = [];
    selectedPoints = [];
    schemeChange = true;
    drawElements();
    // ////console.log("elements = ", elements);
}

function setSameData() {
    $('#roof_dialog').dialog("close");
    setSameRoofPoints(selectedElements);
    selectedElements = [];
    selectedPoints = [];
    schemeChange = true;
    drawElements();
}