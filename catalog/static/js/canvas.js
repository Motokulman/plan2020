var canvas_0 = document.getElementById('canvas_0'); // канва для рисования схемы
var canvas_1 = document.getElementById('canvas_1'); // канва для линий приклейки
var canvas_2 = document.getElementById('canvas_2'); // канва для размеров
var canvas_3 = document.getElementById('canvas_3'); // канва для подсвечивания выделенного размера
var ctx_0 = canvas_0.getContext('2d');
var ctx_1 = canvas_1.getContext('2d');
var ctx_2 = canvas_2.getContext('2d');
var ctx_3 = canvas_3.getContext('2d');
var selectedLineType = "straight"; // Тип линии при рисовании - прямая или кривая
var selectedEdge = "1"; // Количество граней стены
var selectedTool = "none"; // Выбранный элемент для рисования, стена, или еще что-то. Изначально - ничего не выбрано
var mousePosArray = []; // массив позиций мыши при рисовании. 
var mousePos; // Позиции мыши по х и у, с учетом положения канвы на экране
var mmOfMousePos; // Позиция в миллиметрах, соответствующая текущему положению мыши с учетом смещения и масштаба
var points = []; // Массив точек в миллиметрах. Первая точка - точка отсчета, начало коопдинат
var zeroPointPadding = []; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var walls = []; // Массив стен
var scale = 25; // Сделать получение из настроек и сохранение в них
var empty_scheme = true;// Правда, если еще нет ни одного элемента в схеме
var sizeTextSettings = { topPadding: 10, bottomPadding: 5, leftPadding: 5, rightPadding: 30 }; // массив с настройками для отображения размеров на  экране

//console.log("sizeTextSettings = ", sizeTextSettings);

// рисуем прямую линию или 
function drawLine(p, p1, context) {
    context.beginPath();
    context.moveTo(p.x, p.y);
    context.lineTo(p1.x, p1.y);
    context.fillStyle = '#333333';
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
function cancelDraw() {
    sortArrById(points);
    for (var i = 0; i < mousePosArray.length; i++) {
        points.pop();
    }
    mousePosArray = [];
}
$(document).keydown(function (eventObject) {
    if (eventObject.which == 27) { // если нажата клавиша escape
        if (mousePosArray.length != 0) { // если массив точек при рисовании не пуст, то есть мы еще рисуем
            cancelDraw(); // удаляем последние точки
        }
    };
});


//***************************************************************
// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas_0.addEventListener('click', function (e) {
    if (selectedTool != 'none') { // если хоть что то выбрано
        if (empty_scheme) { // если это первая точка в схеме, то она становится центром координат
            points.push({ id: 0, x: 0, y: 0 });
            zeroPointPadding.x = mousePos.x * scale;
            zeroPointPadding.y = mousePos.y * scale;
            empty_scheme = false;
        } else {
            //console.log("findMaxId(points) + 1 = ", findMaxId(points) + 1);
            points.push({ id: findMaxId(points) + 1, x: mmOfMousePos.x, y: mmOfMousePos.y }); // переводим в мм и вносим в массив, приваивая индекс, соджержащийся в последней ячейке + 1
        }
        //  console.log("findMaxId(points) 0 = ", findMaxId(points));
        stick(); // чтобы линии рисовались даже если пользователь только поставил точку и еще не двинул мышь
        drawAxeSize();
    }
    //console.log("points = ", points);
    switch (selectedTool) {
        case 'wall':
            if (selectedLineType == 'straight') { // если выбран прямой тип линии
                if (selectedEdge == 1) { // если грань одна, то есть это одна стена
                    if (mousePosArray.length == 0) { // если это первый клик в этом цикле рисования прямой стены
                        mousePosArray[0] = mousePos;
                        drawPoint(mousePos);
                    } else { // если это второй клик в этом цикле рисования прямой стены
                        //console.log("Второй клик");
                        mousePosArray[1] = mousePos;
                        drawPoint(mousePos); // Нарисовали вторую точку
                        drawLine(mousePosArray[0], mousePosArray[1], ctx_0); // Нарисовали прямую
                        walls.push({ id0: findMaxId(points), id1: findMaxId(points) - 1, id2: null }); // Заносим id Точек в массив стен в мм
                        mousePosArray = []; // Обнуляем массив
                        // console.log("walls = ", walls);
                        // console.log("points = ", points);
                    }
                } else if (selectedEdge == 3) { // если это эркер
                    if (mousePosArray.length == 0) { // если это первый клик в этом цикле рисования эркера из трех граней
                        mousePosArray[0] = mousePos;
                        drawPoint(mousePos);
                    } else if (mousePosArray.length == 1) { // если это второй клик в этом цикле рисования эркера из трех граней
                        mousePosArray[1] = mousePos;
                        drawPoint(mousePos); // Нарисовали вторую точку
                    } else if (mousePosArray.length == 2) { // если это третий клик в этом цикле рисования эркера из трех граней
                        var currentPoint = mousePos; // зафиксируем точку, для защиты от изменения в процессе вычисления

                        var middlePix = [];// середина отрезка нужна для вычисления двух других точек
                        middlePix.x = Math.abs(mousePosArray[0].x - mousePosArray[1].x) / 2 + Math.min(mousePosArray[0].x, mousePosArray[1].x);
                        middlePix.y = Math.abs(mousePosArray[0].y - mousePosArray[1].y) / 2 + Math.min(mousePosArray[0].y, mousePosArray[1].y);

                        var middleOnePix = []; // первая внутренняя точка, лежащая на первоначальном отрезке
                        middleOnePix.x = Math.abs(mousePosArray[0].x - middlePix.x) / 2 + Math.min(mousePosArray[0].x, middlePix.x);
                        middleOnePix.y = Math.abs(mousePosArray[0].y - middlePix.y) / 2 + Math.min(mousePosArray[0].y, middlePix.y);
                        drawPoint(middleOnePix);

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

                        var middleTwoPix = []; // вторая внутренняя точка
                        middleTwoPix.x = Math.abs(mousePosArray[1].x - middlePix.x) / 2 + Math.min(mousePosArray[1].x, middlePix.x);
                        middleTwoPix.y = Math.abs(mousePosArray[1].y - middlePix.y) / 2 + Math.min(mousePosArray[1].y, middlePix.y);
                        drawPoint(middleTwoPix);

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

                        drawLine(mousePosArray[0], mousePosArray[2], ctx_0);
                        drawLine(mousePosArray[2], mousePosArray[3], ctx_0);
                        drawLine(mousePosArray[3], mousePosArray[1], ctx_0);
                    }
                }
            } else { // если это не прямая

            }
            break;
        case 'none':
            break;
    }
});

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
    drawWalls();
});


// Определяем, какой тип элемента хочет нарисовать пользователь - кривую или прямую
$('#line_type_selector button').click(function () {
    $(this).addClass('active').siblings().removeClass('active');
    selectedLineType = this.id;
    // console.log("selectedLineType = ", selectedLineType);
});

$('#edge').change(function () { // определим, сколько граней выбрал пользователь
    $(this).addClass('active').siblings().removeClass('active');
    selectedEdge = this.value;
    // alert(selectedEdge);
});

// Определяем, какой элемент выбрал пользователь (стена или что-то иное)
$('#element_selector button').click(function () {
    $(this).addClass('active').siblings().removeClass('active');
    selectedTool = this.id;
    //console.log("selectedTool = ", selectedTool);
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
    stick();
    clear(ctx_3, canvas_3);
});

// Определяем координаты курсора для канвы с размерами
canvas_2.addEventListener('mousemove', function (e) {
    mousePos = getMousePos(canvas_2, e);
    clear(ctx_1, canvas_1);
    defineTextSize();
});

// Воспроизведение из массива стен
function drawWalls() {
    clear(ctx_0, canvas_0);
    var p = [];
    var p1 = [];
    for (wall of walls.values()) {
        p = points.find(item => item.id == wall.id0);
        p1 = points.find(item => item.id == wall.id1);
        drawPoint(mmToPix(p));
        drawPoint(mmToPix(p1));
        drawLine(mmToPix(p), mmToPix(p1), ctx_0);

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
    clear(ctx_1, canvas_1);
    // Перебор всех точек
    for (item of points.values()) {
        var a = [];
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
                drawLine(p, p1, ctx_3);
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
                    drawLine(p, p1, ctx_3);
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
                    drawLine(p, p1, ctx_3);
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
                    drawLine(p, p1, ctx_3);
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
        drawWalls();
    }
});

// Вывод текста - координат осей
function drawAxeSize() {
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
    drawWalls();
}
