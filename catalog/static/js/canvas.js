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
        ctx_1.moveTo(sizeTextSettings.leftPadding + 20, mousePos.y);
        ctx_1.lineTo(canvas_1.width - sizeTextSettings.rightPadding - 2, mousePos.y);
    } else if (type == "v") {
        ctx_1.moveTo(mousePos.x, sizeTextSettings.topPadding + 2);
        ctx_1.lineTo(mousePos.x, canvas_1.height - sizeTextSettings.bottomPadding - 2);
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
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {// поиск совпадений по х
            //console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
            mousePos.x = a.x;
            mmOfMousePos.x = item.x;
            drawHVLine("v");
            // выделим верхний размер, если курсор попал на него
            if (mousePos.y - sizeTextSettings.topPadding + ctx_2.measureText("0").actualBoundingBoxAscent / 2 <= ctx_2.measureText("0").actualBoundingBoxAscent) {
                clear(ctx_1, canvas_1);
                var p = { x: a.x - 10, y: sizeTextSettings.topPadding + 2 };
                var p1 = { x: a.x + 10, y: sizeTextSettings.topPadding + 2 };
                drawLine(p, p1, ctx_1);
            }
        }
        if (Math.abs(mousePos.y - a.y) <= stick_pix) { // поиск совпадений по у
            mousePos.y = a.y;
            mmOfMousePos.y = item.y;
            drawHVLine("h");
            // выделим правый размер, если курсор попал на него
            if (mousePos.x >= canvas_0.width - sizeTextSettings.rightPadding) {
                clear(ctx_1, canvas_1);
                var p = { x: canvas_0.width - sizeTextSettings.rightPadding, y: a.y + ctx_2.measureText("0").actualBoundingBoxAscent + 1 };
                var p1 = { x: canvas_0.width - sizeTextSettings.rightPadding + 20, y: a.y + ctx_2.measureText("0").actualBoundingBoxAscent + 1 };
                drawLine(p, p1, ctx_1);
            }
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
    //detectSize();
    //console.log("mousePos 0= ", mousePos);
});

canvas_1.addEventListener('mousemove', function (e) {

    console.log("mousePos 0= ", mousePos);
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
    var text = "0"; // текст, выводимый на экран
    var textMiddle = ctx_2.measureText(text).width / 2; // длина текста, поделеная пополам для центровки по осям
    ctx_2.fillText(0, mmToPix(points[0]).x - textMiddle, sizeTextSettings.topPadding); // верхнияя нулевая ось х
    for (let i = 1; i < points.length; i++) {
        if (points[i].x != points[i - 1].x) {
            text = points[i].x - points[0].x;
            textMiddle = ctx_2.measureText(text).width / 2;
            ctx_2.fillText(text, mmToPix(points[i]).x - textMiddle, sizeTextSettings.topPadding); // верхние х - сами оси
            var a = mmToPix(points[i]).x - mmToPix(points[i - 1]).x; // расстояние между осями в пикселях
            text = points[i].x - points[i - 1].x;
            textMiddle = ctx_2.measureText(text).width / 2;
            ctx_2.fillText(text, a / 2 + mmToPix(points[i - 1]).x - textMiddle, canvas_2.height - sizeTextSettings.bottomPadding); // нижние х - расстояния между осями
        }
    }
    sortArrByY(points);
    text = "0";
    textMiddle = ctx_2.measureText(text).actualBoundingBoxAscent / 2; // высота текста
    console.log("textMiddle.x = ", textMiddle);
    ctx_2.fillText(text, canvas_2.width - sizeTextSettings.rightPadding, mmToPix(points[points.length - 1]).y + textMiddle); // правая нулевая ось Y
    for (let i = points.length - 2; i >= 0; i--) {
        if (points[i].y != points[i + 1].y) {
            text = points[points.length - 1].y - points[i].y;
            textMiddle = ctx_2.measureText(text).actualBoundingBoxAscent / 2; // высота текста
            ctx_2.fillText(text, canvas_2.width - sizeTextSettings.rightPadding, mmToPix(points[i]).y + textMiddle); // правые y - сами оси
            var a = mmToPix(points[i + 1]).y - mmToPix(points[i]).y;
            text = points[i + 1].y - points[i].y;
            textMiddle = ctx_2.measureText(text).actualBoundingBoxAscent / 2; // высота текста
            ctx_2.fillText(points[i + 1].y - points[i].y, sizeTextSettings.leftPadding, a / 2 + mmToPix(points[i]).y + textMiddle); // левые y - расстояния между осями
        }
    }
}

// Определение текстового размера, над которым находится мышь
function detectSize() {
    // for (item of points.values()) {
    //     var a = []; // массив с координатами в пикселях, воспроизведенных из массива с точками, где размеры в мм
    //     a.x = mmToPix(item).x;
    //     a.y = mmToPix(item).y;
    //     if (Math.abs(mousePos.x - a.x) <= ctx_2.measureText("0").actualBoundingBoxAscent) { 
    //         if (Math.abs(mousePos.y - sizeTextSettings.topPadding + ctx_2.measureText("0").actualBoundingBoxAscent/2) <= ctx_2.measureText("0").actualBoundingBoxAscent) {
    //             console.log("item.id ", item.id);
    //         }
    //     }

    // }




    // var stick_pix = 5;
    // clear(ctx_1, canvas_1);
    // // Перебор всех точек
    // for (item of points.values()) {
    //     var a = [];
    //     a.x = mmToPix(item).x;
    //     //console.log("a.x = ", a.x);
    //     a.y = mmToPix(item).y;
    //     if (Math.abs(mousePos.x - a.x) <= stick_pix) {
    //         //console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
    //         mousePos.x = a.x;
    //         mmOfMousePos.x = item.x;
    //         drawHVLine("v");
    //     }
    //     if (Math.abs(mousePos.y - a.y) <= stick_pix) {
    //         mousePos.y = a.y;
    //         mmOfMousePos.y = item.y;
    //         drawHVLine("h");
    //     }
    // }

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
