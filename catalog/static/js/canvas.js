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
var zeroPointPadding = {'x': 0, 'y': 0}; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var lines = []; // Массив связей между точками. 
var elements = []; // Фигура, содержит массив элементов и закон их взаимодействия
var scale = 25; // Сделать получение из настроек и сохранение в них
var empty_scheme = true;// Правда, если еще нет ни одного элемента в схеме
var sizeTextSettings = { topPadding: 10, bottomPadding: 5, leftPadding: 5, rightPadding: 30 }; // массив с настройками для отображения размеров на  экране
var prePointsMM = []; // массив новых точек при рисовании элемента. Потом добавляется в основной массив точек
var selectedElements = [];// массив выделенных на схеме элементов (id)
var schemeChange = false;
var checked = false; // прверен проект или нет




// рисуем точку
function drawPoint(p) {
    ctx_0.beginPath();
    ctx_0.arc(p.x, p.y, 5, 0, 2 * Math.PI);
    ctx_0.fillStyle = '#333333';
    ctx_0.fill();
    ctx_0.closePath();
}

// рисуем прямую линию или 
function drawLine(p, p1, context, color, blur) {
    context.beginPath();
    context.moveTo(p.x, p.y);
    context.lineTo(p1.x, p1.y);
    context.strokeStyle = color;
    //context.lineWidth = 3;
    if (blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }
    context.stroke();
}


// функция рисования окружности 
function drawCircleElement(element, context, color, blur) {
    context.beginPath();
    // поскольку мы пока упростили и при создании окружности она становится правильным полукругом, то центр окружности тупо середина базовой линии
    var line = lines.find(line => line.id == element.ids[0]); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
    var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
    var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
    drawPoint(point0);
    drawPoint(point1);
    var middle = [];
    middle.x = Math.min(point0.x, point1.x) + Math.abs(point0.x - point1.x) / 2;
    middle.y = Math.min(point0.y, point1.y) + Math.abs(point0.y - point1.y) / 2;
    var radius = lengthLine(point0, point1) / 2;
    if (point0.y == point1.y) {
        if (((element.direction == "left") && (point0.x < point1.x))) {
            context.arc(middle.x, middle.y, radius, 0, Math.PI, true);
        } else if (((element.direction == "right") && (point0.x < point1.x))) {
            context.arc(middle.x, middle.y, radius, 0, Math.PI, false);
        } else if (((element.direction == "left") && (point0.x > point1.x))) {
            context.arc(middle.x, middle.y, radius, Math.PI, 0, true);
        } else if (((element.direction == "right") && (point0.x > point1.x))) {
            context.arc(middle.x, middle.y, radius, Math.PI, 0, false);
        }
    } else if (point0.x == point1.x) {
        if (((element.direction == "left") && (point0.y < point1.y))) {
            context.arc(middle.x, middle.y, radius, Math.PI / 2, 3 * Math.PI / 2, true);
        } else if (((element.direction == "right") && (point0.y < point1.y))) {
            context.arc(middle.x, middle.y, radius, Math.PI / 2, 3 * Math.PI / 2, false);
        } else if (((element.direction == "right") && (point0.y > point1.y))) {
            context.arc(middle.x, middle.y, radius, 3 * Math.PI / 2, Math.PI / 2, false);
        } else if (((element.direction == "left") && (point0.y > point1.y))) {
            context.arc(middle.x, middle.y, radius, 3 * Math.PI / 2, Math.PI / 2, true);
        }
    }
    context.strokeStyle = color;
    if (blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }
    context.stroke();
}

let hello = "привет мир. пока мир";
let key = "мир";
let firstPos = hello.indexOf(key);

// Воспроизведение из массива стен
function drawElements() {  //drawWalls
    clear(ctx_0, canvas_0);
    var strokeStyle = 1;
    for (element of elements.values()) { // перебираем все элементы - прямые, эркеры, кривые
        if ((element.distance > 0) && (element.ids.length == 1)) { // если это окружность
            ctx_0.lineWidth = 1; 
            strokeStyle = "black";// если ничего не задано
           // drawCircleElement(element, ctx_0, strokeStyle); 
            if (element.wallType.indexOf("partition") >= 0) {// если это перегородка
                ctx_0.lineWidth = 6;
                strokeStyle = "black"
                drawCircleElement(element, ctx_0, strokeStyle);
                ctx_0.lineWidth = 2;
            } else if (element.wallType.indexOf("bearing") >= 0) {// если это несущая стена 
                ctx_0.lineWidth = 12;
                strokeStyle = "black"
                drawCircleElement(element, ctx_0, strokeStyle);
                if (element.wallType.indexOf("outdoor") >= 0) { 
                    ctx_0.lineWidth = 10;
                    strokeStyle = "orange"
                    drawCircleElement(element, ctx_0, strokeStyle);
                }
            }
            ctx_0.lineWidth = 4;
            if (element.liveType == "living") {
                strokeStyle = "yellow";
            } else if (element.liveType == "uninhabited") {
                strokeStyle = "Gainsboro";
            }
            drawCircleElement(element, ctx_0, strokeStyle);
        } else {
            for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
                var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
                var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
                var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
                ctx_0.lineWidth = 1;
                strokeStyle = "black";// если ничего не задано
            //    drawLine(point0, point1, ctx_0, strokeStyle);
                if (element.wallType.indexOf("partition") >= 0) {// если это перегородка
                    ctx_0.lineWidth = 6;
                    strokeStyle = "black"
                    drawLine(point0, point1, ctx_0, strokeStyle);
                    ctx_0.lineWidth = 2;
                } else if (element.wallType.indexOf("bearing") >= 0) {// если это несущая стена
                    ctx_0.lineWidth = 12;
                    strokeStyle = "black"
                    drawLine(point0, point1, ctx_0, strokeStyle);
                    if (element.wallType.indexOf("outdoor") >= 0) {
                        ctx_0.lineWidth = 10;
                        strokeStyle = "orange"
                        drawLine(point0, point1, ctx_0, strokeStyle);
                    }
                }
                ctx_0.lineWidth = 4;
                if (element.wallType.indexOf("living") >= 0) {
                    strokeStyle = "yellow";
                } else if (element.wallType.indexOf("uninhabited") >= 0) {
                    strokeStyle = "Gainsboro";
                }
                drawLine(point0, point1, ctx_0, strokeStyle);
            }
        }

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
                // console.log("sel = ", sel);
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
    // console.log("elements = ", elements);
}