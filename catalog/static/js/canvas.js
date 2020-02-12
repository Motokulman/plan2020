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
var zeroPointPadding = []; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var lines = []; // Массив связей между точками. 
var elements = []; // Фигура, содержит массив элементов и закон их взаимодействия
var scale = 25; // Сделать получение из настроек и сохранение в них
var empty_scheme = true;// Правда, если еще нет ни одного элемента в схеме
var sizeTextSettings = { topPadding: 10, bottomPadding: 5, leftPadding: 5, rightPadding: 30 }; // массив с настройками для отображения размеров на  экране
var prePointsMM = []; // массив новых точек при рисовании элемента. Потом добавляется в основной массив точек
var selectedElements = [];// массив выделенных на схеме элементов (id)
var underMouseElement; // элемент, над которым сейчас находится мышь

//console.log("sizeTextSettings = ", sizeTextSettings);

// рисуем прямую линию или 
function drawLine(p, p1, context, color, blur) {
    context.beginPath();
    context.moveTo(p.x, p.y);
    context.lineTo(p1.x, p1.y);
    context.strokeStyle = color;
    context.lineWidth = 3;
    if (blur == true) {
        context.shadowBlur = 5;
        context.shadowColor = "blue";
    }
    context.stroke();
}

// рисуем прямую линию, проходящую через всю канву - для линий приклейки
function drawHVLine(type) {
    ctx_1.beginPath();
    if (type == "h") {
        ctx_1.moveTo(0, mousePos.y);
        ctx_1.lineTo(canvas_1.width, mousePos.y);
    } else if (type == "v") {
        ctx_1.moveTo(mousePos.x, 0);
        ctx_1.lineTo(mousePos.x, canvas_1.height);
    }
    ctx_1.fillStyle = '#333333';
    ctx_1.stroke();
}

// рисуем точку
function drawPoint(p) {
    ctx_0.beginPath();
    ctx_0.arc(p.x, p.y, 5, 0, 2 * Math.PI);
    ctx_0.fillStyle = '#333333';
    ctx_0.fill();
    ctx_0.closePath();
}

// Удаление, если вдруг передумал рисовать
$(document).keydown(function (eventObject) {
    if (eventObject.which == 27) { // если нажата клавиша escape
        if (prePointsMM.length != 0) { // если массив точек при рисовании не пуст, то есть мы еще рисуем
            prePointsMM = []; // удаляем последние точки
        }
    };
});

// сохранение итоговых точек
function pushPoints(prePointsMM) {
    for (p of prePointsMM.values()) {
        if (points.length == 0) {
            points.push({ id: 0, x: p.x, y: p.y });
        } else {
            points.push({ id: findMaxId(points) + 1, x: p.x, y: p.y }); // переводим в мм и вносим в массив, приваивая индекс, соджержащийся в последней ячейке + 1
        }
    }
}

// сохранение факта связи двух точек
function pushLine(id0, id1) {
    if (lines.length == 0) {
        lines.push({ id: 0, id0: id0, id1: id1 });
    } else {
        lines.push({ id: findMaxId(lines) + 1, id0: id0, id1: id1 });
    }
}

// сохранение элемента. Элемент состоит из одной или более линий. 
function pushElement(el) { // ids - массив id линий, из которых состоит данный элемент  ids, distance, direction
    if (elements.length == 0) {
        console.log("el = ", el);
        elements.push({ id: 0, ids: el.ids, distance: el.distance, direction: el.direction });
    } else {
        elements.push({ id: findMaxId(elements) + 1, ids: el.ids, distance: el.distance, direction: el.direction });
    }
}

// сохранение промежуточной точки 
function pushPrePointMM(mmOfMousePos) {
    if ((points.length == 0) && (prePointsMM.length == 0)) { // если это первая точка в схеме, то она становится центром координат
        zeroPointPadding.x = mousePos.x * scale;
        zeroPointPadding.y = mousePos.y * scale;
        mmOfMousePos = pixToMm(mousePos);
        prePointsMM.push({ x: 0, y: 0 });
    } else {
        prePointsMM.push({ x: mmOfMousePos.x, y: mmOfMousePos.y });
        //console.log("mmOfMousePos = ", mmOfMousePos);
    }

}

//***************************************************************
// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas_0.addEventListener('click', function (e) {
    var newLinesIds = [];// массив, куда будут сохраняться id новых линий, а затем сохраняться в элементе
    var newElement = [];// элементы сначала создаем отдельно, т.к. они все разные, прописываем свойства для каждого, и лишь потом добавляем в массив.
    switch (selectedTool) {
        case 'wall':
            if (selectedLineType == 'straight') { // если выбран прямой тип линии

                if (prePointsMM.length == 0) { // если это первый клик в этом цикле рисования прямой стены
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                } else { // если это второй клик в этом цикле рисования прямой стены
                    pushPrePointMM(mmOfMousePos);
                    pushPoints(prePointsMM);
                    prePointsMM = [];
                    drawPoint(mousePos); // Нарисовали вторую точку
                    pushLine(findMaxId(points) - 1, findMaxId(points)); // занесли в массив линий нашу новую линию
                    newLinesIds[0] = findMaxId(lines);// занесли в промежуточный массив id единственной линии, которая будет храниться в данном элементе (т.к. это просто ровная стена)
                    newElement = { ids: newLinesIds };
                    // console.log("newElement = ", newElement);
                    pushElement(newElement); // занесли в массив с элементами id нашей линии стены/ радиус = 0 чтобы отличить стену от радиусного элемента
                }

            } else if (selectedLineType == 'polygon') { // если это многоугольник. У многоугольника всезда есть две начальные точки, которые могут совпадать
                if (prePointsMM.length == 0) { // если это первый или второй клик в этом цикле рисования
                    pushPrePointMM(mmOfMousePos);
                    mousePosArray[0] = mousePos;
                    drawPoint(mousePos);
                } else if (prePointsMM.length == 1) { // заблокируем пока возможность создавать эркеры относительно наклонных прямых
                    pushPrePointMM(mmOfMousePos);
                    if ((prePointsMM[0].x != prePointsMM[1].x) && (prePointsMM[0].y != prePointsMM[1].y)) {
                        prePointsMM = [];
                        alert("Создавать наклонные эркеры пока нельзя :(");
                        //clear(ctx_1, canvas_1);
                    } else {
                        mousePosArray[1] = mousePos;
                        drawPoint(mousePos);
                    }
                } else if (mousePosArray.length == 2) { // если это третий клик в этом цикле рисования эркера из трех граней
                    var currentPoint = mousePos; // зафиксируем точку, для защиты от изменения в процессе вычисления

                    var middlePix = [];// середина отрезка нужна для вычисления двух других точек
                    middlePix.x = Math.abs(mousePosArray[0].x - mousePosArray[1].x) / 2 + Math.min(mousePosArray[0].x, mousePosArray[1].x);
                    middlePix.y = Math.abs(mousePosArray[0].y - mousePosArray[1].y) / 2 + Math.min(mousePosArray[0].y, mousePosArray[1].y);

                    var middleOnePix = []; // первая внутренняя точка, лежащая на первоначальном отрезке
                    middleOnePix.x = Math.abs(mousePosArray[0].x - middlePix.x) / 2 + Math.min(mousePosArray[0].x, middlePix.x);
                    middleOnePix.y = Math.abs(mousePosArray[0].y - middlePix.y) / 2 + Math.min(mousePosArray[0].y, middlePix.y);
                    //drawPoint(middleOnePix);

                    var anotherPoint = []; // найдем первую эркерную точку
                    if (mousePosArray[0].y == mousePosArray[1].y) { // если начальная линия строго горизонтальна
                        anotherPoint.y = currentPoint.y;
                        anotherPoint.x = middleOnePix.x;
                    } else if (mousePosArray[0].x == mousePosArray[1].x) {// если начальная линия строго вертикальна
                        anotherPoint.x = currentPoint.x;
                        anotherPoint.y = middleOnePix.y;
                    } else {
                        anotherPoint.x = (currentPoint.x - middlePix.x) + middleOnePix.x;
                        anotherPoint.y = middleOnePix.y - (anotherPoint.x - middleOnePix.x) * (mousePosArray[0].x - middlePix.x) / (mousePosArray[0].y - middlePix.y);
                    }
                    drawPoint(anotherPoint);
                    mousePosArray[2] = anotherPoint;
                    pushPrePointMM(pixToMm(anotherPoint));

                    var middleTwoPix = []; // вторая внутренняя точка
                    middleTwoPix.x = Math.abs(mousePosArray[1].x - middlePix.x) / 2 + Math.min(mousePosArray[1].x, middlePix.x);
                    middleTwoPix.y = Math.abs(mousePosArray[1].y - middlePix.y) / 2 + Math.min(mousePosArray[1].y, middlePix.y);
                    //drawPoint(middleTwoPix);

                    var anotherPoint = []; // найдем вторую эркерную точку
                    if (mousePosArray[0].y == mousePosArray[1].y) { // если начальная линия строго горизонтальна
                        anotherPoint.y = currentPoint.y;
                        anotherPoint.x = middleTwoPix.x;
                    } else if (mousePosArray[0].x == mousePosArray[1].x) {// если начальная линия строго вертикальна
                        anotherPoint.x = currentPoint.x;
                        anotherPoint.y = middleTwoPix.y;
                    } else {
                        anotherPoint.x = (currentPoint.x - middlePix.x) + middleTwoPix.x;
                        anotherPoint.y = middleTwoPix.y - (anotherPoint.x - middleTwoPix.x) * (middlePix.x - mousePosArray[1].x) / (middlePix.y - mousePosArray[1].y);
                    }
                    drawPoint(anotherPoint);
                    mousePosArray[3] = anotherPoint;
                    pushPrePointMM(pixToMm(anotherPoint));
                    pushPoints(prePointsMM);
                    pushLine(findMaxId(points) - 3, findMaxId(points) - 1); // занесли в массив линий нашу первую новую линию
                    pushLine(findMaxId(points) - 1, findMaxId(points)); // занесли в массив линий нашу вторую новую линию
                    pushLine(findMaxId(points), findMaxId(points) - 2); // занесли в массив линий нашу третью новую линию
                    prePointsMM = [];
                    newLinesIds[0] = findMaxId(lines) - 2;
                    newLinesIds[1] = findMaxId(lines) - 1;
                    newLinesIds[2] = findMaxId(lines);
                    newElement = { ids: newLinesIds };
                    pushElement(newElement);
                    drawLine(mousePosArray[0], mousePosArray[2], ctx_0, '#333333');
                    drawLine(mousePosArray[2], mousePosArray[3], ctx_0, '#333333');
                    drawLine(mousePosArray[3], mousePosArray[1], ctx_0, '#333333');
                    mousePosArray = [];
                }
                // Рисуем кривую    
            } else if (selectedLineType == 'curve') {
                if (prePointsMM.length == 0) { // если это первый или второй клик в этом цикле рисования кривой
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                } else if (prePointsMM.length == 1) { // заблокируем пока возможность создавать окружности относительно наклонных прямых
                    pushPrePointMM(mmOfMousePos);
                    if ((prePointsMM[0].x != prePointsMM[1].x) && (prePointsMM[0].y != prePointsMM[1].y)) {
                        prePointsMM = [];
                        alert("Создавать наклонные окружности пока нельзя :(");
                        // clear(ctx_1, canvas_1);
                    } else {
                        drawPoint(mousePos);
                    }
                } else {
                    pushPoints(prePointsMM);
                    pushLine(findMaxId(points) - 1, findMaxId(points)); // занесли в массив линий нашу новую линию
                    newLinesIds[0] = findMaxId(lines);// занесли в промежуточный массив id единственной линии
                    var diameter = Math.round(Math.sqrt(Math.pow((prePointsMM[0].x - prePointsMM[1].x), 2) + Math.pow((prePointsMM[0].y - prePointsMM[1].y), 2))); // пусть пока это будет правильный полукруг
                    var distance = diameter / 2;// определим расстояние от дальней точки окружности до базовой прямой. Этот способ позволяет хранить только это расстояние и направление. Для простоты оно равно радиусу, что нужно для правильного полукруга. Поэтому рано 0.
                    // определим по какую сторону от прямой кликнул пользователь. Если стоим на первой точке и смотрим на вторую. + значит слева, - справа
                    var d = (mmOfMousePos.x - prePointsMM[0].x) * (prePointsMM[1].y - prePointsMM[0].y) - (mmOfMousePos.y - prePointsMM[0].y) * (prePointsMM[1].x - prePointsMM[0].x)
                    if (d > 0) { //+ значит слева
                        newElement = { ids: newLinesIds, distance: distance, direction: "left" };
                    } else {
                        newElement = { ids: newLinesIds, distance: distance, direction: "right" };
                    }
                    pushElement(newElement);
                    prePointsMM = [];
                    //  console.log("elements = ", elements);
                }
            }
            break;
        case 'none': // выделяем элементы кликами:
            var selectedElementIndex = selectedElements.indexOf(defineElement());
            if (selectedElementIndex >= 0) {
                selectedElements.splice(selectedElementIndex, 1);
            } else {
                selectedElements.push(defineElement());
            }
            break;
    }
});

// функция определения перпендикулярной прямой, а точнее у по х
// function findYOnNormal(p0, p1, x) {
//     var newPoint = [];
//     var k = (p0.x - p1.x) / (p0.y - p1.y);
//     var middlePix = [];// середина отрезка
//     middlePix.x = Math.abs(p0.x - p1.x) / 2 + Math.min(p0.x, p1.x);
//     middlePix.y = Math.abs(p0.y - p1.y) / 2 + Math.min(p0.y, p1.y);
//     newPoint.x = x;
//     newPoint.y = middlePix.y - k * (x - middlePix.x);
//     return newPoint;
// }


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

// функция очистки канвы
function clear(context, canvas) {
    context.clearRect(0, 0, canvas.width, canvas.height);
}

// Перевод миллиметров в пиксели
function mmToPix(arr) {
    return {
        x: Math.round((arr.x + zeroPointPadding.x) / scale),
        y: Math.round((arr.y + zeroPointPadding.y) / scale)
    };
}

// Перевод пикселей в миллиметры
function pixToMm(arr) {
    return {
        x: Math.round(arr.x * scale - zeroPointPadding.x),
        y: Math.round(arr.y * scale - zeroPointPadding.y)
    };
}


// Проверочные действия
$('#test_buttons button').click(function () {
    // drawWalls();
});


// Определяем, какой тип элемента хочет нарисовать пользователь - кривую или прямую
$('#line_type_selector button').click(function () {
    $(this).addClass('active').siblings().removeClass('active');
    selectedLineType = this.id;
    // console.log("selectedLineType = ", selectedLineType);
});

$('#polygon_sides').change(function () { // определим, сколько граней выбрал пользователь
    $(this).addClass('active').siblings().removeClass('active');
    polygonSides = this.value;
    //alert(polygonSides);
});

// Определяем, какой элемент выбрал пользователь (стена или что-то иное)
$('#element_selector button').click(function () {
    $(this).addClass('active').siblings().removeClass('active');
    selectedTool = this.id;
    console.log("selectedTool = ", selectedTool);
});

// Получаем координаты курсора в зависимости от положения канвы на экране
function getMousePos(canvas, e) {
    var rect = canvas.getBoundingClientRect();
    return {
        x: e.clientX - Math.round(rect.left),
        y: e.clientY - Math.round(rect.top)
    };
}

// Определяем координаты курсора для схемной канвы
canvas_0.addEventListener('mousemove', function (e) {
    mousePos = getMousePos(canvas_0, e);
    mmOfMousePos = pixToMm(mousePos);
    drawAxeSize();
    clear(ctx_3, canvas_3);
    if (selectedTool == 'none') {
        defineElement();
    } else {
        stick();
    }
});

// Определяем координаты курсора для канвы с размерами
canvas_2.addEventListener('mousemove', function (e) {
    mousePos = getMousePos(canvas_2, e);
    clear(ctx_1, canvas_1);
    defineTextSize();
});

// определение длины линии
function lengthLine(p0, p1) {
    var length = Math.sqrt(Math.pow((p0.x - p1.x), 2) + Math.pow((p0.y - p1.y), 2));
    return length;
}

// Воспроизведение из массива стен
function drawElements() {  //drawWalls
    clear(ctx_0, canvas_0);
    for (element of elements.values()) { // перебираем все элементы - прямые, эркеры, кривые
        // console.log("element = ", element);
        if ((element.distance > 0) && (element.ids.length == 1)) { // если это окружность
            drawCircleElement(element, ctx_0, "black");
        } else {
            for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
                var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
                var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
                var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
                drawLine(point0, point1, ctx_0, "black");
            }
        }

    }
}

// определение наведения на элемент
function defineElement() {
    clear(ctx_1, canvas_1);
    var p0, p1;
    var a = -1;
    for (element of elements.values()) { // перебираем все элементы - прямые, эркеры, кривые
        if ((element.distance > 0) && (element.ids.length == 1)) { // если это окружность
            // поскольку мы пока упростили и при создании окружности она становится правильным полукругом, то

            var line = lines.find(line => line.id == element.ids[0]); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
            var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
            var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
            // drawPoint(point0);
            // drawPoint(point1);
            var middle = [];
            middle.x = Math.min(point0.x, point1.x) + Math.abs(point0.x - point1.x) / 2;
            middle.y = Math.min(point0.y, point1.y) + Math.abs(point0.y - point1.y) / 2;
            // console.log("element = ", element);
            // console.log("element.distance = ", mmToPix(element.distance));
            if (Math.abs(lengthLine(mousePos, middle) - element.distance / scale) <= 5) { // если попадаем курсором на нашу упрощенную (превращенную в правльный полукруг) окружность
                //console.log("dyenhb= ");
                drawCircleElement(element, ctx_1, '#888888', true);
                a = element.id;
            }
            //drawCircleElement(element); то пока не работает
        } else {
            for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
                var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
                p0 = mmToPix(points.find(point => point.id == line.id0));
                p1 = mmToPix(points.find(point => point.id == line.id1));
                if (straightAffiliation(p0, p1, mousePos) == true) { // если курсор лежит на прямой между этими точками, то выделяем каждую линию данного элемента
                    for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
                        var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
                        p0 = mmToPix(points.find(point => point.id == line.id0));
                        p1 = mmToPix(points.find(point => point.id == line.id1));
                        drawLine(p0, p1, ctx_1, '#888888', true);
                        console.log("element.id = ", element.id);
                        a = element.id;
                    }
                    //                   console.log("element.id = ", element.id);
                    return a;
                }
            }
        }
    }
}

// определение принадлежности точки прямой
function straightAffiliation(p0, p1, p2) {
    var tolerance = 10;
    if ((Math.abs(Math.abs(p0.x - p1.x) - Math.abs(p0.x - p2.x) - Math.abs(p2.x - p1.x)) <= tolerance) && (Math.abs(Math.abs(p0.y - p1.y) - Math.abs(p0.y - p2.y) - Math.abs(p2.y - p1.y)) <= tolerance)) {
        //  console.log("defineElement = ", walls.indexOf(wall));
        return true;
    } else {
        return false;
    }
}

// Сортировка масиива точек по x
function sortArrByX(arr) {
    arr.sort(function (a, b) {
        if (a.x > b.x) {
            return 1;
        }
        if (a.x < b.x) {
            return -1;
        } else {
            return 0;
        }
    });
}
// Сортировка масиива точек по y
function sortArrByY(arr) {
    arr.sort(function (a, b) {
        if (a.y > b.y) {
            return 1;
        }
        if (a.y < b.y) {
            return -1;
        } else {
            return 0;
        }
    });
}
// Сортировка масиива точек по y
function sortArrById(arr) {
    arr.sort(function (a, b) {
        if (a.id > b.id) {
            return 1;
        }
        if (a.id < b.id) {
            return -1;
        } else {
            return 0;
        }
    });
}

// Определение максимального поля id массива
function findMaxId(arr) {
    var a = 0;
    for (item of arr.values()) {
        if (item.id > a) {
            a = item.id;
        }
    }
    return a;
}

// Приклейка
function stick() {
    var stick_pix = 10;
    var a = [];
    clear(ctx_1, canvas_1);
    // Перебор всех точек
    for (item of points.values()) {

        a.x = mmToPix(item).x;
        //console.log("a.x = ", a.x);
        a.y = mmToPix(item).y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {// поиск совпадений по х
            //console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
            mousePos.x = a.x;
            mmOfMousePos.x = item.x;
            drawHVLine("v");
        }
        if (Math.abs(mousePos.y - a.y) <= stick_pix) { // поиск совпадений по у
            mousePos.y = a.y;
            mmOfMousePos.y = item.y;
            drawHVLine("h");
        }
    }
    // то же для предварительного массива точек
    for (p of prePointsMM.values()) {
        a.x = mmToPix(p).x;
        //console.log("a.x = ", a.x);
        a.y = mmToPix(p).y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {// поиск совпадений по х
            //console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
            mousePos.x = a.x;
            mmOfMousePos.x = p.x;
            drawHVLine("v");
        }
        if (Math.abs(mousePos.y - a.y) <= stick_pix) { // поиск совпадений по у
            mousePos.y = a.y;
            mmOfMousePos.y = p.y;
            drawHVLine("h");
        }

    }
}

// Определение наведения на размер
function defineTextSize() {
    var axis = "";
    var type = "";
    var size = 0;
    var sizePrevious = 0;

    clear(ctx_3, canvas_3);
    sortArrByX(points);
    var text;
    var a = [];
    // Перебор всех точек
    for (let i = 0; i < points.length; i++) {
        a.x = mmToPix(points[i]).x;
        text = points[i].x - points[0].x;
        // выделим верхний размер, если курсор попал на него
        if ((Math.abs(mousePos.x - a.x - parseInt(canvas_0.style.left, 10)) <= 10) && (text != "0")) {// поиск совпадений по х, причем наводить можно на всю ширины текста (<= ctx_2.measureText(text).width/2). Сделать защиту от наложенных текстов 
            if (Math.abs((mousePos.y - parseInt(canvas_0.style.top, 10) / 2)) <= 5) {
                var p = { x: a.x + parseInt(canvas_0.style.left, 10) - ctx_2.measureText(text).width / 2, y: parseInt(canvas_0.style.top, 10) * 0.8 };
                var p1 = { x: a.x + parseInt(canvas_0.style.left, 10) + ctx_2.measureText(text).width / 2, y: parseInt(canvas_0.style.top, 10) * 0.8 };
                drawLine(p, p1, ctx_3, '#333333');
                axis = "x";
                type = "abs";
                size = points[i].x;
            }
        }
        // выделим нижний размер, если курсор попал на него
        if (i > 0) {
            text = points[i].x - points[i - 1].x;
            if ((Math.abs(mousePos.x - mmToPix(points[i - 1]).x - (mmToPix(points[i]).x - mmToPix(points[i - 1]).x) / 2 - parseInt(canvas_0.style.left, 10)) <= 10) && (text != 0)) {

                if (Math.abs((parseInt(canvas_2.height, 10) - mousePos.y - ctx_2.measureText("0").actualBoundingBoxAscent)) <= 5) {
                    var p = { x: mmToPix(points[i - 1]).x + (mmToPix(points[i]).x - mmToPix(points[i - 1]).x) / 2 - ctx_2.measureText(text).width / 2 + parseInt(canvas_0.style.left, 10), y: canvas_2.height - 2 };
                    var p1 = { x: mmToPix(points[i - 1]).x + (mmToPix(points[i]).x - mmToPix(points[i - 1]).x) / 2 + ctx_2.measureText(text).width / 2 + parseInt(canvas_0.style.left, 10), y: canvas_2.height - 2 };
                    drawLine(p, p1, ctx_3, '#333333');
                    axis = "x";
                    type = "rel";
                    size = points[i].x;
                    sizePrevious = points[i - 1].x;
                }
            }
        }
    }

    // выделим правый размер, если курсор попал на него
    sortArrByY(points);
    for (let i = points.length - 2; i >= 0; i--) {
        if (points[i].y != points[i + 1].y) {
            a.y = mmToPix(points[i]).y;
            text = points[points.length - 1].y - points[i].y;
            // выделим правый размер
            if ((Math.abs(mousePos.y - a.y - parseInt(canvas_0.style.top, 10)) <= ctx_2.measureText("0").actualBoundingBoxAscent) && (text != "0")) {// поиск совпадений по y, причем наводить можно на всю ширины текста (<= ctx_2.measureText(text).width/2). Сделать защиту от наложенных текстов 
                if (Math.abs((parseInt(canvas_2.width, 10) - parseInt(canvas_0.style.left, 10) / 2 - mousePos.x)) < parseInt(canvas_0.style.left, 10) / 2 - 10) {
                    var p = { x: parseInt(canvas_2.width, 10) - parseInt(canvas_0.style.left, 10) + 2, y: a.y + parseInt(canvas_0.style.top, 10) + ctx_2.measureText("0").actualBoundingBoxAscent };
                    var p1 = { x: parseInt(canvas_2.width, 10) - 2, y: a.y + parseInt(canvas_0.style.top, 10) + ctx_2.measureText("0").actualBoundingBoxAscent };
                    drawLine(p, p1, ctx_3, '#333333');
                    axis = "y";
                    type = "abs";
                    size = points[i].y;
                    console.log("size ", size);
                }
            }
        }
    }

    // выделим левый размер, если курсор попал на него
    if (mousePos.x < parseInt(canvas_0.style.left, 10)) {
        for (let i = points.length - 2; i >= 0; i--) {
            a.y = mmToPix(points[i]).y - mmToPix(points[i + 1]).y;
            if ((Math.abs(mousePos.y - mmToPix(points[i]).y + a.y / 2 - parseInt(canvas_0.style.top, 10)) < ctx_2.measureText("0").actualBoundingBoxAscent) && (points[i].y != points[points.length - 1].y) && (a.y != 0)) {
                // console.log("canvas_0.style.left/2 ", parseInt(canvas_0.style.left, 10)/2);
                if (Math.abs(mousePos.x - parseInt(canvas_0.style.left, 10) / 2) < parseInt(canvas_0.style.left, 10) / 2 - 15) {
                    var p = { x: 2, y: a.y / 2 + mmToPix(points[i + 1]).y + parseInt(canvas_0.style.top, 10) + ctx_2.measureText("0").actualBoundingBoxAscent };
                    var p1 = { x: parseInt(canvas_0.style.left, 10) - 10, y: a.y / 2 + mmToPix(points[i + 1]).y + parseInt(canvas_0.style.top, 10) + ctx_2.measureText("0").actualBoundingBoxAscent };
                    drawLine(p, p1, ctx_3, '#333333');
                    axis = "y";
                    type = "rel";
                    size = points[i].y;
                    sizePrevious = points[i + 1].y;
                }
            }
        }
    }
    return {
        axis: axis,
        type: type,
        size: size,
        sizePrevious: sizePrevious
    };
}

// Изменение размеров
canvas_2.addEventListener('click', function (e) {
    var data = defineTextSize();
    if (data.type != "") {
        var size;
        var newSize;
        var delta;
        var replacement;
        // сначала иксы
        sortArrByX(points);
        if (data.axis == "x") {
            if (data.type == "abs") { // если это абсолютные значения
                size = data.size - points[0].x;
                size = prompt('', size);
                if (size === null) size = '';
                // меняем размеры
                if ((size != "") && (+ size > 0)) { // если значение было введено
                    console.log("size ", size);
                    for (let i = 1; i < points.length; i++) {
                        if (data.size <= points[i].x) {
                            delta = + size - data.size + points[0].x;
                            newSize = points[i].x + delta;
                            console.log("newSize ", newSize);
                            replacement = { id: points[i].id, x: newSize, y: points[i].y };
                            points.splice(i, 1, replacement);
                        }
                    }
                }

            } else if (data.type == "rel") { // если это расстояния между осями
                size = Math.abs(data.size - data.sizePrevious);
                newSize = prompt('', size);
                if (newSize === null) newSize = '';
                if ((newSize != "") && (newSize != size) && (+ newSize > 0)) { // если значение было введено
                    delta = + newSize - Math.abs(data.size - data.sizePrevious);
                    for (let i = 1; i < points.length; i++) {
                        if (points[i].x >= data.size) {
                            newSize = points[i].x + delta;
                            replacement = { id: points[i].id, x: newSize, y: points[i].y };
                            points.splice(i, 1, replacement);
                        }
                    }
                }

            }
        }

        // затем игрики
        sortArrByY(points);
        if (data.axis == "y") {
            if (data.type == "abs") { // если это абсолютные значения
                size = Math.abs(data.size - points[points.length - 1].y);
                size = prompt('', size);
                if (size === null) size = '';
                //console.log("size ", size);
                // меняем размеры
                if ((size != "") && (+ size > 0)) { // если значение было введено
                    for (let i = points.length - 1; i >= 0; i--) {
                        if (data.size >= points[i].y) {
                            delta = + size - Math.abs(data.size - points[points.length - 1].y);
                            newSize = points[i].y - delta;
                            console.log("newSize ", newSize);
                            replacement = { id: points[i].id, x: points[i].x, y: newSize };
                            points.splice(i, 1, replacement);
                        }
                    }
                }

            } else if (data.type == "rel") { // если это расстояния между осями
                size = Math.abs(data.sizePrevious - data.size);
                newSize = prompt('', size);
                if (newSize === null) newSize = '';
                if ((newSize != "") && (newSize != size) && (+ newSize > 0)) { // если значение было введено
                    delta = + newSize - Math.abs(data.size - data.sizePrevious);
                    for (let i = points.length - 1; i >= 0; i--) {
                        if (data.size >= points[i].y) {
                            newSize = points[i].y - delta;
                            replacement = { id: points[i].id, x: points[i].x, y: newSize };
                            points.splice(i, 1, replacement);
                        }
                    }
                }

            }
        }
        clear(ctx_3, canvas_3);
        drawAxeSize();
        //    drawWalls();
    }
});

// Вывод текста - координат осей
function drawAxeSize() {
    if (points.length != 0) {
        ctx_2.font = "14px Verdana";
        clear(ctx_2, canvas_2);
        sortArrByX(points);
        var text = "0"; // текст, выводимый на экран
        //  console.log("canvas_0.style.left ", parseInt(canvas_0.style.left, 10));
        var textMiddle = ctx_2.measureText(text).width / 2; // длина текста, поделеная пополам для центровки по осям
        ctx_2.fillText(0, mmToPix(points[0]).x - textMiddle + parseInt(canvas_0.style.left, 10), ctx_2.measureText("0").actualBoundingBoxAscent * 1.25); // верхнияя нулевая ось х
        for (let i = 1; i < points.length; i++) {
            if (points[i].x != points[i - 1].x) {
                text = points[i].x - points[0].x;
                textMiddle = ctx_2.measureText(text).width / 2;
                ctx_2.fillText(text, mmToPix(points[i]).x - textMiddle + parseInt(canvas_0.style.left, 10), ctx_2.measureText("0").actualBoundingBoxAscent * 1.25); // верхние х - сами оси
                var a = mmToPix(points[i]).x - mmToPix(points[i - 1]).x; // расстояние между осями в пикселях
                text = points[i].x - points[i - 1].x;
                textMiddle = ctx_2.measureText(text).width / 2;
                ctx_2.fillText(text, a / 2 + mmToPix(points[i - 1]).x - textMiddle + parseInt(canvas_0.style.left, 10), canvas_2.height - ctx_2.measureText("0").actualBoundingBoxAscent * 0.6); // нижние х - расстояния между осями
            }
        }
        sortArrByY(points);
        text = "0";
        textMiddle = ctx_2.measureText(text).actualBoundingBoxAscent / 2; // высота текста
        // console.log("textMiddle.x = ", textMiddle);
        ctx_2.fillText(text, canvas_2.width - parseInt(canvas_0.style.left, 10) * 0.93, mmToPix(points[points.length - 1]).y + textMiddle + parseInt(canvas_0.style.top, 10)); // правая нулевая ось Y
        for (let i = points.length - 2; i >= 0; i--) {
            if (points[i].y != points[i + 1].y) {
                text = points[points.length - 1].y - points[i].y;
                textMiddle = ctx_2.measureText(text).actualBoundingBoxAscent / 2; // высота текста
                ctx_2.fillText(text, canvas_2.width - parseInt(canvas_0.style.left, 10) * 0.93, mmToPix(points[i]).y + textMiddle + parseInt(canvas_0.style.top, 10)); // правые y - сами оси
                var a = mmToPix(points[i + 1]).y - mmToPix(points[i]).y;
                text = points[i + 1].y - points[i].y;
                textMiddle = ctx_2.measureText(text).actualBoundingBoxAscent / 2; // высота текста
                ctx_2.fillText(points[i + 1].y - points[i].y, 3, a / 2 + mmToPix(points[i]).y + textMiddle + parseInt(canvas_0.style.top, 10)); // левые y - расстояния между осями
            }
        }
    }
}

// Масштабирование колесиком мыши
var elem = document.getElementById('stage');
if (elem.addEventListener) {
    if ('onwheel' in document) {
        elem.addEventListener("wheel", onWheel);// IE9+, FF17+
    } else if ('onmousewheel' in document) {
        elem.addEventListener("mousewheel", onWheel);// устаревший вариант события
    } else {
        elem.addEventListener("MozMousePixelScroll", onWheel);// Firefox < 17
    }
} else { // IE8-
    elem.attachEvent("onmousewheel", onWheel);
}

function onWheel(e) {
    e = e || window.event;
    var delta = e.deltaY || e.detail || e.wheelDelta;
    e.preventDefault ? e.preventDefault() : (e.returnValue = false);
    var scale_old = scale;
    scale = (parseFloat(scale) + parseFloat(delta / 100)).toFixed(1);
    if (scale == 0) scale = 0.001;

    if (scale_old > scale) {
        zeroPointPadding.x = Math.round((zeroPointPadding.x / scale_old + (zeroPointPadding.x / scale_old - mousePos.x) / scale) * scale);
        // console.log("zeroPointPadding.x = ", zeroPointPadding.x);
        zeroPointPadding.y = Math.round((zeroPointPadding.y / scale_old + (zeroPointPadding.y / scale_old - mousePos.y) / scale) * scale);
    } else {
        zeroPointPadding.x = Math.round((zeroPointPadding.x / scale_old - (zeroPointPadding.x / scale_old - mousePos.x) / scale) * scale);
        zeroPointPadding.y = Math.round((zeroPointPadding.y / scale_old - (zeroPointPadding.y / scale_old - mousePos.y) / scale) * scale);
    }
    clear(ctx_3, canvas_3);
    drawAxeSize();
    drawElements();
}
