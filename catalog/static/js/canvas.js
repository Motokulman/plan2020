var canvas_0 = document.getElementById('canvas_0'); // канва для рисования схемы
var canvas_1 = document.getElementById('canvas_1'); // канва для линий приклейки
var canvas_2 = document.getElementById('canvas_2'); // канва для размеров
var canvas_3 = document.getElementById('canvas_3'); // канва для подсвечивания выделенного размера
var ctx_0 = canvas_0.getContext('2d');
var ctx_1 = canvas_1.getContext('2d');
var ctx_2 = canvas_2.getContext('2d');
var ctx_3 = canvas_3.getContext('2d');
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
var scale = 25; // Сделать получение из настроек и сохранение в них
var empty_scheme = true;// Правда, если еще нет ни одного элемента в схеме
var sizeTextSettings = { topPadding: 10, bottomPadding: 5, leftPadding: 5, rightPadding: 30 }; // массив с настройками для отображения размеров на  экране
var prePointsMM = []; // массив новых точек при рисовании элемента. Потом добавляется в основной массив точек
var selectedElements = [];// массив выделенных на схеме элементов (id)
var schemeChange = false;
var checked = false; // прверен проект или нет
var plate_garage = []; // массив перекрытий гаражного типа, который включает в себя координаты точки в мм внутри поемещения. Сделать проверку, чтоб не было двух таких меток внутри одного помещения и сделать удаление
var level; //уровень - первого или второго этажа
var drawSettings = [];

var drawSettingsDefault = {
    strokeStyle: 'black',
    lineWidth: 1,
    fillStyle: "blue",
    blur: false
}

function getLineContext(line, context) {// функуия для получения контекста в зависимоти от формы линии. Если так не сделать, в разных функциях приедтся кодить для кривой
    //console.log('points.find(point => point.id == line.id0) = ', points.find(point => point.id == line.id0));
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
        context.moveTo(point0.x, point0.y);
        context.lineTo(point1.x, point1.y);
    }
}


// рисуем точку
function drawPoint(p) {
    ctx_0.beginPath();
    ctx_0.arc(p.x, p.y, 5, 0, 2 * Math.PI);
    ctx_0.fillStyle = '#333333';
    ctx_0.fill();
    ctx_0.closePath();
}

function drawShape(element, context, drawSettings) {
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    context.fillStyle = drawSettings.fillStyle;
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }
    context.beginPath();
    for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в элементе
        var line = lines.find(line => line.id == line_id);
        getLineContext(line, context);
    }
    context.closePath();
    context.stroke();
}

// рисуем линию, в зависимости от содержимого прямую или кривую
function drawLine(line, context, drawSettings) {
    //console.log("drawLine!");
    // context.strokeStyle = drawSettingsDefault.strokeStyle;
    // context.lineWidth = drawSettingsDefault.lineWidth;
    context.strokeStyle = drawSettings.strokeStyle;
    context.lineWidth = drawSettings.lineWidth;
    if (drawSettings.blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }
    context.beginPath();
    getLineContext(line, context);
    context.stroke();
}


// функция рисования окружности 
// function drawCircleElement(element, context, color, blur) {
//     context.beginPath();
//     // поскольку мы пока упростили и при создании окружности она становится правильным полукругом, то центр окружности тупо середина базовой линии
//     var line = lines.find(line => line.id == element.ids[0]); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
//     var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
//     var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
//     drawPoint(point0);
//     drawPoint(point1);
//     var middle = [];
//     middle.x = Math.min(point0.x, point1.x) + Math.abs(point0.x - point1.x) / 2;
//     middle.y = Math.min(point0.y, point1.y) + Math.abs(point0.y - point1.y) / 2;
//     var radius = lengthLine(point0, point1) / 2;
//     if (point0.y == point1.y) {
//         if (((element.direction == "left") && (point0.x < point1.x))) {
//             context.arc(middle.x, middle.y, radius, 0, Math.PI, true);
//         } else if (((element.direction == "right") && (point0.x < point1.x))) {
//             context.arc(middle.x, middle.y, radius, 0, Math.PI, false);
//         } else if (((element.direction == "left") && (point0.x > point1.x))) {
//             context.arc(middle.x, middle.y, radius, Math.PI, 0, true);
//         } else if (((element.direction == "right") && (point0.x > point1.x))) {
//             context.arc(middle.x, middle.y, radius, Math.PI, 0, false);
//         }
//     } else if (point0.x == point1.x) {
//         if (((element.direction == "left") && (point0.y < point1.y))) {
//             context.arc(middle.x, middle.y, radius, Math.PI / 2, 3 * Math.PI / 2, true);
//         } else if (((element.direction == "right") && (point0.y < point1.y))) {
//             context.arc(middle.x, middle.y, radius, Math.PI / 2, 3 * Math.PI / 2, false);
//         } else if (((element.direction == "right") && (point0.y > point1.y))) {
//             context.arc(middle.x, middle.y, radius, 3 * Math.PI / 2, Math.PI / 2, false);
//         } else if (((element.direction == "left") && (point0.y > point1.y))) {
//             context.arc(middle.x, middle.y, radius, 3 * Math.PI / 2, Math.PI / 2, true);
//         }
//     }
//     context.strokeStyle = color;
//     if (blur == true) {
//         context.shadowBlur = 5;
//         context.shadowColor = "blue";
//     }
//     context.stroke();
// }

// let hello = "привет мир. пока мир";
// let key = "мир";
// let firstPos = hello.indexOf(key);
function drawElement(element) {
    drawSettings = drawSettingsDefault;
    if (element.type == 'wall') { // если это стена
        drawSettings = { // задаем умолчания, если тип стены еще не задан
            lineWidth: 1
        }
        if (element.subType.indexOf("partition") >= 0) {// если это перегородка
            drawSettings = {
                lineWidth: 6
            }
        } else if (element.subType.indexOf("bearing") >= 0) {// если это несущая стена 
            drawSettings = {
                lineWidth: 12
            }
            if (element.subType.indexOf("outdoor") >= 0) {
                drawSettings = {
                    lineWidth: 12,
                    strokeStyle: "orange"
                }
            }
        }
        for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
            var line = lines.find(line => line.id == line_id);
            //console.log('line! = ', line);
            drawLine(line, ctx_0, drawSettings);
        }
    } else if (element.type == 'stairwell') { // если это лестничный пролет
        drawShape(element, ctx_0, drawSettingsDefault);
    }
}



// Воспроизведение из массива стен
function drawElements() {  //drawWalls
    clear(ctx_0, canvas_0);
    // var strokeStyle = 1;
    for (element of elements.values()) {// перебираем все элементы 
        drawElement(element);
    }
}



// попробуем создать модальное окно https://professorweb.ru/my/javascript/jquery/level4/4_9.php
$(function () {
    $('#dialog').dialog({
        buttons: [{ text: "OK", click: applyWallData }, { text: "Отмена", click: function () { $(this).dialog("close") } }],
        modal: true,
        autoOpen: false,
        width: 340
    })
});


// обработка правого клика
$("#stage").bind('contextmenu', function (e) {
    if (selectedElements.length > 0) {
        $('#dialog').dialog("open");
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
                // //console.log("sel = ", sel);
                var a = bearType + "_" + liveType;
                if (bearType == "bearing") {
                    a = a + "_" + outdoorType;
                }
                el.wallType = a;
            }
        }
    }
    $('#dialog').dialog("close");
    selectedElements = [];
    schemeChange = true;
    drawElements();
    // //console.log("elements = ", elements);
}