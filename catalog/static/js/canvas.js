var canvas_0 = document.getElementById('canvas_0'); // основная канва
var canvas_1 = document.getElementById('canvas_1'); // канва для линий приклейки
var canvas_2 = document.getElementById('canvas_2'); // канва для размеров
var ctx_0 = canvas_0.getContext('2d');
var ctx_1 = canvas_1.getContext('2d');
var ctx_2 = canvas_2.getContext('2d');
var selectedLineType = "straight"; // Тип линии при рисовании - прямая или кривая
var selectedTool = "none"; // Выбранный элемент для рисования, стена, или еще что-то. Изначально - ничего не выбрано
var mousePosArray = []; // массив позиций мыши при рисовании. 
var mousePos; // Позиции мыши по х и у, с учетом положения канвы на экране
var mmOfMousePos; // Позиция в миллиметрах, соответствующая текущему положению мыши с учетом смещения и масштаба
var points = []; // Массив точек в миллиметрах. Первая точка - точка отсчета, начало коопдинат
var zeroPointPadding = []; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var walls = []; // Массив стен
var scale = 25; // Сделать получение из настроек и сохранение в них
var empty_scheme = true;// Правда, если еще нет ни одного элемента в схеме


// рисуем прямую линию или 
function drawLine(p, p1) {
    ctx_0.beginPath();
    ctx_0.moveTo(p.x, p.y);
    ctx_0.lineTo(p1.x, p1.y);
    ctx_0.fillStyle = '#333333';
    ctx_0.stroke();
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


// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas_0.addEventListener('click', function (e) {
    if (selectedTool != 'none') { // если хоть что то выбрано
        if (empty_scheme) { // если это первая точка в схеме, то она становится центром координат
            points.push([0, { x: 0, y: 0 }]);
            zeroPointPadding.x = mousePos.x * scale;
            zeroPointPadding.y = mousePos.y * scale;
            empty_scheme = false;
            //console.log("zeroPointPadding = ", zeroPointPadding);
        } else {
            if (stick()) {
                console.log("stick = ");
            }
            points.push([points[points.length - 1][0] + 1, mmOfMousePos]); // переводим в мм и вносим в массив, приваивая индекс, соджержащийся в последней ячейке + 1
        }
        stick(); // чтобы линии рисовались даже если пользователь только поставил точку и еще не двинул мышь
        drawAxeSize();
    }
    //console.log("points = ", points);
    switch (selectedTool) {
        case 'wall':
            if (selectedLineType == 'straight') { // если выбран прямой тип линии
                if (mousePosArray.length == 0) { // если это первый клик в этом цикле рисования прямой стены
                    mousePosArray[0] = mousePos;
                    drawPoint(mousePos);

                } else { // если это второй клик в этом цикле рисования прямой стены
                    //console.log("Второй клик");
                    mousePosArray[1] = mousePos;
                    drawPoint(mousePos); // Нарисовали вторую точку
                    drawLine(mousePosArray[0], mousePosArray[1], ctx_0); // Нарисовали прямую
                    walls.push([points[points.length - 2][0], points[points.length - 1][0], null]); // Заносим id Точек в массив стен в мм
                    mousePosArray = []; // Обнуляем массив
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

// Приклейка
function stick() {
    var stick_pix = 3;
    clear(ctx_1, canvas_1);
    // Перебор всех точек
    for (item of points.values()) {
        var a = [];
        a.x = mmToPix(item[1]).x;
        a.y = mmToPix(item[1]).y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {
            //console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
            mousePos.x = a.x;
            mmOfMousePos.x = item[1].x;
            drawHVLine("v");
        }
        if (Math.abs(mousePos.y - a.y) <= stick_pix) {
            mousePos.y = a.y;
            mmOfMousePos.y = item[1].y;
            drawHVLine("h");
        }
    }
}

// Перевод миллиметров в пиксели
function mmToPix(mmArr) {
    return {
        x: Math.round((mmArr.x + zeroPointPadding.x) / scale),
        y: Math.round((mmArr.y + zeroPointPadding.y) / scale)
    };
}

// Перевод пикселей в миллиметры
function pixToMm(pixArr) {
    return {
        x: Math.round(pixArr.x * scale - zeroPointPadding.x),
        y: Math.round(pixArr.y * scale - zeroPointPadding.y)
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
    console.log("selectedLineType = ", selectedLineType);
});

// Определяем, какой элемент выбрал пользователь (стена или что-то иное)
$('#element_selector button').click(function () {
    $(this).addClass('active').siblings().removeClass('active');
    selectedTool = this.id;
    //console.log("selectedTool = ", selectedTool);
});

// Получаем координаты курсора в зависимости от положения канвы на экране
function getMousePos(canvas_0, e) {
    var rect = canvas_0.getBoundingClientRect();
    return {
        x: e.clientX - Math.round(rect.left),
        y: e.clientY - Math.round(rect.top)
    };
}

// Определяем координаты курсора
canvas_0.addEventListener('mousemove', function (e) {
    mousePos = getMousePos(canvas_0, e);
    mmOfMousePos = pixToMm(mousePos);
    stick();
    //console.log("mousePos 0= ", mousePos);
});

// Воспроизведение из массива стен
function drawWalls() {
    clear(ctx_0, canvas_0);
    for (wall of walls.values()) {
        for (point of points.values()) {
            if (wall[0] == point[0]) {
                drawPoint(mmToPix(point[1], point[2]));
            }
            if (wall[1] == point[0]) {
                drawPoint(mmToPix(point[1], point[2]));
            }
        }
    }
}

// Вывод текста - координат осей
function drawAxeSize() {
    clear(ctx_2, canvas_2);
    // var xMin = 0, yMin = 0;
    // for (point of points.values()) {// Определяем минимальные координаты чтоб скорректировать все остальные
    //     if (point[1].x < xMin) xMin = point[1].x;
    //     if (point[1].y < yMin) yMin = point[1].y;
    // }
    // for (let i = 0; i < points.length; i++) {
    //     ctx_2.fillText(points[i][1].x - xMin, mmToPix(points[i][1]).x, 10); // верхние х - сами оси
    //     ctx_2.fillText(points[i][1].y - yMin, canvas_2.width - 30, mmToPix(points[i][1]).y); // правые y - сами оси
    //     if (i > 0) {
    //         ctx_2.fillText(points[i][1].x - xMin - , mmToPix(points[i][1]).x, 10); // левые х - расстояния между осями
    //     }
        
    // }
    console.log("points = ", points);
    //console.log("sort ");
    points.sort(function (a, b) {
        console.log("ax = ", a.x);
        if (a.x > b.x) {
          return 1;
        }
        if (a.x < b.x) {
          return -1;
        }
        // a должно быть равным b
        return 0;
      });
   //   console.log("points = ", points);
   //   console.log("-------------------- ");
    // for (point of points.values()) {



        
    //     }
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
        console.log("zeroPointPadding.x = ", zeroPointPadding.x);
        zeroPointPadding.y = Math.round((zeroPointPadding.y / scale_old + (zeroPointPadding.y / scale_old - mousePos.y) / scale) * scale);
    } else {
        zeroPointPadding.x = Math.round((zeroPointPadding.x / scale_old - (zeroPointPadding.x / scale_old - mousePos.x) / scale) * scale);
        zeroPointPadding.y = Math.round((zeroPointPadding.y / scale_old - (zeroPointPadding.y / scale_old - mousePos.y) / scale) * scale);
    }
    drawAxeSize();
    drawWalls();
}
