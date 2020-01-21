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
            console.log("findMaxId(points) + 1 = ", findMaxId(points) + 1);
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
                    console.log("walls = ", walls);
                    console.log("points = ", points);
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
    var stick_pix = 5;
    clear(ctx_1, canvas_1);
    // Перебор всех точек
    for (item of points.values()) {
        var a = [];
        a.x = mmToPix(item).x;
        //console.log("a.x = ", a.x);
        a.y = mmToPix(item).y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {
            //console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
            mousePos.x = a.x;
            mmOfMousePos.x = item.x;
            drawHVLine("v");
        }
        if (Math.abs(mousePos.y - a.y) <= stick_pix) {
            mousePos.y = a.y;
            mmOfMousePos.y = item.y;
            drawHVLine("h");
        }
    }
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
            // console.log("wall= ", wall);
            // console.log("point= ", point);
            if (wall.id0 == point.id) {
                drawPoint(mmToPix(point));
            }
            if (wall.id1 == point.id) {
                drawPoint(mmToPix(point));
            }
        }
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

// Вывод текста - координат осей
function drawAxeSize() {
    clear(ctx_2, canvas_2);
    sortArrByX(points);
    ctx_2.fillText(0, mmToPix(points[0]).x, 10); // верхнияя нулевая ось х
    for (let i = 1; i < points.length; i++) {
        if (points[i].x != points[i - 1].x) {
            ctx_2.fillText(points[i].x - points[0].x, mmToPix(points[i]).x, 10); // верхние х - сами оси
            var a = mmToPix(points[i]).x - mmToPix(points[i - 1]).x;
            ctx_2.fillText(points[i].x - points[i - 1].x, a / 2 + mmToPix(points[i - 1]).x, canvas_2.height - 5); // нижние х - расстояния между осями
        }
    }    
    sortArrByY(points);
    ctx_2.fillText(0, canvas_2.width - 30, mmToPix(points[points.length - 1]).y); // правая нулевая ось Y
    for (let i = points.length - 2; i >= 0; i--) {
        if  (points[i].y != points[i + 1].y) {
            ctx_2.fillText(points[points.length - 1].y - points[i].y, canvas_2.width - 30, mmToPix(points[i]).y); // правые y - сами оси
            var a = mmToPix(points[i + 1]).y - mmToPix(points[i]).y;
            ctx_2.fillText(points[i + 1].y - points[i].y, 5, a / 2 + mmToPix(points[i]).y); // левые y - расстояния между осями
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
    drawAxeSize();
    drawWalls();
}
