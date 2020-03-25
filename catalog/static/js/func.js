var csrf_token = $('#canvas_form [name="csrfmiddlewaretoken"]').val();

function drawSimpleLine(p0, p1, context, color) {
    context.strokeStyle = color;
    context.beginPath();
    context.moveTo(p0.x, p0.y);
    context.lineTo(p1.x, p1.y);
    context.closePath();
    context.stroke();
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
                drawSimpleLine(p, p1, ctx_3, '#333333');
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
                    drawSimpleLine(p, p1, ctx_3, '#333333');
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
                    drawSimpleLine(p, p1, ctx_3, '#333333');
                    axis = "y";
                    type = "abs";
                    size = points[i].y;
                    //console.log("size ", size);
                }
            }
        }
    }

    // выделим левый размер, если курсор попал на него
    if (mousePos.x < parseInt(canvas_0.style.left, 10)) {
        for (let i = points.length - 2; i >= 0; i--) {
            a.y = mmToPix(points[i]).y - mmToPix(points[i + 1]).y;
            if ((Math.abs(mousePos.y - mmToPix(points[i]).y + a.y / 2 - parseInt(canvas_0.style.top, 10)) < ctx_2.measureText("0").actualBoundingBoxAscent) && (points[i].y != points[points.length - 1].y) && (a.y != 0)) {
                // //console.log("canvas_0.style.left/2 ", parseInt(canvas_0.style.left, 10)/2);
                if (Math.abs(mousePos.x - parseInt(canvas_0.style.left, 10) / 2) < parseInt(canvas_0.style.left, 10) / 2 - 15) {
                    var p = { x: 2, y: a.y / 2 + mmToPix(points[i + 1]).y + parseInt(canvas_0.style.top, 10) + ctx_2.measureText("0").actualBoundingBoxAscent };
                    var p1 = { x: parseInt(canvas_0.style.left, 10) - 10, y: a.y / 2 + mmToPix(points[i + 1]).y + parseInt(canvas_0.style.top, 10) + ctx_2.measureText("0").actualBoundingBoxAscent };
                    drawSimpleLine(p, p1, ctx_3, '#333333');
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

// определение наведения на элемент
function defineElement() {
    // console.log("defineElement ");
    clear(ctx_1, canvas_1);
    var rate = -1;
    var p0, p1;
    var a = -1; // id элемента, над которым сейчас курсор
    for (element of elements.values()) { // перебираем все элементы - прямые, эркеры, кривые, лестничные пролеты
        if ((((element.type == "wall") || (element.type == "roof")) && (element.level == level)) || (element.type != "wall")) { // если стены, тос их видим только если они на нашем уровне
            for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                var line = lines.find(line => line.id == line_id);
                p0 = mmToPix(points.find(point => point.id == line.id0));
                p1 = mmToPix(points.find(point => point.id == line.id1));
                var d = lengthLine(p0, p1);
                var D = lengthLine(p0, mousePos);
                if (line.distance > 0) {// если это окружность
                    var middle = [];
                    middle.x = Math.min(p0.x, p1.x) + Math.abs(p0.x - p1.x) / 2;
                    middle.y = Math.min(p0.y, p1.y) + Math.abs(p0.y - p1.y) / 2;
                    if (Math.abs(lengthLine(mousePos, middle) - line.distance / scale) <= 5) { // если попадаем курсором на нашу упрощенную (превращенную в правльный полукруг) окружность
                        // drawCircleElement(element, ctx_1, '#888888', true);
                        a = element.id;
                        // определим длину дуги от начальной точки до точки клика, для сохранения расположения окон 
                        var sin = D / d;
                        if (sin > 1) {
                            sin = 1;
                        }
                        var alpha = Math.asin(sin);
                        if (Math.abs(alpha - Math.PI / 4) <= Math.PI / 20) { // если курсор рядом с серединой, приклеиваем к середине
                            alpha = Math.PI / 4;
                        }
                        rate = 2 * alpha / Math.PI;
                        // console.log("alpha = ", alpha);
                    }
                } else { // если же это не окружность
                    if (straightAffiliation(p0, p1, mousePos) == true) { // если курсор лежит на прямой между этими точками, 
                        a = element.id;
                        rate = D / d;
                    }

                }
            }
        }
    }
    if (rate > 1) {
        rate = 1;
    }
    var result = {
        id: a,
        rate: rate
    }
    if (a >= 0) {
        console.log("result = ", result);
    }
    return result;
}



// if ((element.distance > 0) && (element.ids.length == 1)) { // если это окружность
//     if ()
//         // поскольку мы пока упростили и при создании окружности она становится правильным полукругом, то

//         var line = lines.find(line => line.id == element.ids[0]); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
//     var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
//     var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
//     // drawPoint(point0);
//     // drawPoint(point1);
//     var middle = [];
//     middle.x = Math.min(point0.x, point1.x) + Math.abs(point0.x - point1.x) / 2;
//     middle.y = Math.min(point0.y, point1.y) + Math.abs(point0.y - point1.y) / 2;
//     // //console.log("element = ", element);
//     // //console.log("element.distance = ", mmToPix(element.distance));
//     if (Math.abs(lengthLine(mousePos, middle) - element.distance / scale) <= 5) { // если попадаем курсором на нашу упрощенную (превращенную в правльный полукруг) окружность
//         ////console.log("dyenhb= ");
//         drawCircleElement(element, ctx_1, '#888888', true);
//         a = element.id;
//         //  //console.log("element.id= ", element.id);
//     }
//     //drawCircleElement(element); то пока не работает
// } else {
//     for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
//         var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
//         p0 = mmToPix(points.find(point => point.id == line.id0));
//         p1 = mmToPix(points.find(point => point.id == line.id1));
//         if (straightAffiliation(p0, p1, mousePos) == true) { // если курсор лежит на прямой между этими точками, то выделяем каждую линию данного элемента
//             for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
//                 var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
//                 p0 = mmToPix(points.find(point => point.id == line.id0));
//                 p1 = mmToPix(points.find(point => point.id == line.id1));
//                 drawLine(p0, p1, ctx_1, '#888888', true);
//                 ////console.log("element.id = ", element.id);
//                 a = element.id;
//             }
//             //                   //console.log("element.id = ", element.id);

//         }
//     }
// }
// }
// return a;
// }

// определение принадлежности точки прямой
function straightAffiliation(p0, p1, p2) {
    var tolerance = 10;
    if ((Math.abs(Math.abs(p0.x - p1.x) - Math.abs(p0.x - p2.x) - Math.abs(p2.x - p1.x)) <= tolerance) && (Math.abs(Math.abs(p0.y - p1.y) - Math.abs(p0.y - p2.y) - Math.abs(p2.y - p1.y)) <= tolerance)) {
        //  //console.log("defineElement = ", walls.indexOf(wall));
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
    ctx_1.setLineDash([10, 5]);
    ctx_1.strokeStyle = "gray";
    ctx_1.lineWidth = 1.0;
    // Перебор всех точек
    for (item of points.values()) {

        a.x = mmToPix(item).x;
        ////console.log("a.x = ", a.x);
        a.y = mmToPix(item).y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {// поиск совпадений по х
            ////console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
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
        ////console.log("a.x = ", a.x);
        a.y = mmToPix(p).y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {// поиск совпадений по х
            ////console.log("пMath.abs(mousePos.x - a.x) = ", Math.abs(mousePos.x - a.x));
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
                    //console.log("size ", size);
                    for (let i = 1; i < points.length; i++) {
                        if (data.size <= points[i].x) {
                            delta = + size - data.size + points[0].x;
                            newSize = points[i].x + delta;
                            ////console.log("newSize ", newSize);
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
                ////console.log("size ", size);
                // меняем размеры
                if ((size != "") && (+ size > 0)) { // если значение было введено
                    for (let i = points.length - 1; i >= 0; i--) {
                        if (data.size >= points[i].y) {
                            delta = + size - Math.abs(data.size - points[points.length - 1].y);
                            newSize = points[i].y - delta;
                            // //console.log("newSize ", newSize);
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
        drawElements();
        schemeChange = true;
    }
});

// Вывод текста - координат осей
function drawAxeSize() {
    if (points.length != 0) {
        ctx_2.font = "14px Verdana";
        clear(ctx_2, canvas_2);
        sortArrByX(points);
        var text = "0"; // текст, выводимый на экран
        //  //console.log("canvas_0.style.left ", parseInt(canvas_0.style.left, 10));
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
        // //console.log("textMiddle.x = ", textMiddle);
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
        // //console.log("zeroPointPadding.x = ", zeroPointPadding.x);
        zeroPointPadding.y = Math.round((zeroPointPadding.y / scale_old + (zeroPointPadding.y / scale_old - mousePos.y) / scale) * scale);
    } else {
        zeroPointPadding.x = Math.round((zeroPointPadding.x / scale_old - (zeroPointPadding.x / scale_old - mousePos.x) / scale) * scale);
        zeroPointPadding.y = Math.round((zeroPointPadding.y / scale_old - (zeroPointPadding.y / scale_old - mousePos.y) / scale) * scale);
    }
    //console.log('elements = ', elements);
    //console.log('lines = ', lines);
    //console.log('points = ', points);
    clear(ctx_3, canvas_3);
    drawAxeSize();
    drawElements();
    schemeChange = true;
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
    // //console.log("selectedLineType = ", selectedLineType);
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
    selectedElements = [];// зачистим массив выделеных элеиентов
    //console.log("selectedTool = ", selectedTool);
});

// Определяем, какой уровень выбрал пользователь
$('#level_selector button').click(function () {
    $(this).addClass('active').siblings().removeClass('active');
    level = this.id;
    drawElements();
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
        // defineElement();
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

// сохранение факта связи двух точек. Линия содержит две точки, которые соединяются между собой и закон, по которому они соединяются, то есть прямая, кривая и т.д.
function pushLine(id0, id1, distance, direction) {
    if (lines.length == 0) {
        lines.push({ id: 0, id0: id0, id1: id1, distance: distance, direction: direction });
    } else {
        lines.push({ id: findMaxId(lines) + 1, id0: id0, id1: id1, distance: distance, direction: direction });
    }
}

// сохранение элемента. Элемент состоит из одной или более линий. 
function pushElement(el) { // ids - массив id линий, из которых состоит данный элемент  ids, distance, direction
    if (elements.length == 0) {
        // //console.log("el = ", el);bearType: 'not_set', liveType: 'not_set', outdoorType: 'not_set', roof_slope
        elements.push({ id: 0, ids: el.ids, type: el.type, subType: el.subType, level: el.level, roofSlope: el.roofSlope, ridgeHeight: el.ridgeHeight, mauerlatHeight: el.mauerlatHeight, angle: el.angle, highSide: el.highSide });
    } else {
        elements.push({ id: findMaxId(elements) + 1, ids: el.ids, type: el.type, subType: el.subType, level: el.level, roofSlope: el.roofSlope, ridgeHeight: el.ridgeHeight, mauerlatHeight: el.mauerlatHeight, angle: el.angle, highSide: el.highSide });
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
        ////console.log("mmOfMousePos = ", mmOfMousePos);
    }
}

// Обработка нажатий клавиатуры
$(document).keydown(function (eventObject) {// Удаление, если вдруг передумал рисовать 
    if (eventObject.which == 27) { // если нажата клавиша escape
        if (prePointsMM.length != 0) { // если массив точек при рисовании не пуст, то есть мы еще рисуем
            prePointsMM = []; // удаляем последние точки
            selectedElements = [];// зачистим массив выделеных элеиентов
        }
    }
    if ((eventObject.which == 46) && (selectedElements.length > 0)) { // если нажата клавиша delete и если есть выделенные элементы
        for (var sel = 0; sel < selectedElements.length; sel++) {
            for (var i = 0; i < elements.length; i++) { // попробуем использовать for, так как похоже при переборе упрощенными итераторами нельзя удалять
                if (selectedElements[sel] == elements[i].id) { // и если есть, удаляем все линии этого элемента, точки и сам элемент
                    for (var l = 0; l < elements[i].ids.length; l++) { // перебираем массив id линий, хранящийся в каждом элементе item of element.ids.values()
                        for (var line = 0; line < lines.length; line++) { // удалим точки
                            if (elements[i].ids[l] == lines[line].id) {
                                for (var p = 0; p < points.length; p++) {
                                    if (points[p].id == lines[line].id0) {
                                        points.splice(p, 1);
                                    }
                                }
                                for (var p = 0; p < points.length; p++) {
                                    if (points[p].id == lines[line].id1) {
                                        points.splice(p, 1);
                                    }
                                }
                            }
                        }
                    }

                    for (var l = 0; l < elements[i].ids.length; l++) { // теперь удалим сами линии
                        for (var line = 0; line < lines.length; line++) {
                            if (lines[line].id == elements[i].ids[l]) {
                                lines.splice(line, 1);
                            }
                        }
                    }
                    elements.splice(i, 1);
                }
            }
        }
        clear(ctx_0, canvas_0);
        clear(ctx_2, canvas_2);
        clear(ctx_3, canvas_3);
        drawAxeSize();
        drawElements();
        selectedElements = [];
        schemeChange = true;
    }
});


// рисуем прямую линию, проходящую через всю канву - для линий приклейки
function drawHVLine(type) {
    ctx_1.beginPath();
    if (type == "h") {
        ctx_1.moveTo(0, mousePos.y + 0.5);
        ctx_1.lineTo(canvas_1.width, mousePos.y + 0.5);
    } else if (type == "v") {
        ctx_1.moveTo(mousePos.x + 0.5, 0);
        ctx_1.lineTo(mousePos.x + 0.5, canvas_1.height);
    }
    ctx_1.fillStyle = '#333333';
    ctx_1.stroke();
}

// Сохранение схемы
$("#save").click(function () {
    if (schemeChange) { // если схема менялась
        saveScheme();
        checked = false;
    }
});

// Воспроизведение схемы
function getScheme() {
    var data = {};
    var url = 'get_plan';
    $.ajax({
        url: url,
        type: 'GET',
        data: data,
        cache: true,
        //async: false,
        success: function (data) {
            //console.log(" d = ", data);
            p = JSON.parse(data);
            d = JSON.parse(p[0].fields.scheme);
            if (d != null) {
                elements = d.elements;
                lines = d.lines;
                points = d.points;
                scale = d.scale;
                zeroPointPadding = d.zeroPointPadding;
                checked = p.checked;
                drawAxeSize();
                drawElements();
                // //console.log(" Scheme data d = ", d);
            }
        },
        error: function () {
            //console.log("Getting stored scheme error. Scheme data = ", data);
        }
    });
}

function saveScheme() {
    var data = {};
    var d = {};
    // //console.log("elements= ", elements)
    d.elements = elements;
    d.lines = lines;
    d.points = points;
    d.scale = scale;
    d.zeroPointPadding = zeroPointPadding;
    d = JSON.stringify(d);
    data.d = d;
    data.checked = false;
    data["csrfmiddlewaretoken"] = csrf_token;
    //console.log("data до JSON = ", data)
    //console.log("data после JSON, но до пересылки = ", data)
    $.ajax({
        url: 'get_response',
        type: 'POST',
        data: data,
        cache: false,
        async: false,
        success: function (data) {
            schemeChange = false;
            //console.log("Схема сохранена = ", data);
        },
        error: function () {
            //console.log("Ошибка сохранения схемы");
        }
    });
}

$("#restore").click(function () {
    getScheme();
    createFilters();
});

// проверка проекта на возможность выкладки в систему
$("#check").click(function () {
    if (schemeChange) { // если схема менялась, то 
        alert("Проект был изменен. Сначала сохраните изменения")
    } else if (!checked) {
        //console.log("checked = ", checked);
        checkPlan();
    }
});

// выкладка проекта в систему
$("#post").click(function () {
    postPlan();
});

function postPlan() {
    var data = {};
    $.ajax({
        url: 'post_plan',
        type: 'GET',
        data: data,
        success: function (data) {
            //console.log("Выкладка проекта завершена. Подробности:", data);
        },
        error: function () {
            //console.log("Ошибка при выкладке проекта. data = ", data);
        }
    });
}

function checkPlan() {
    var data = {};
    $.ajax({
        url: 'check_plan',
        type: 'GET',
        data: data,
        // cache: false,
        // async: false,
        success: function (data) {
            //console.log("Проверка завершилась. Посмотреть ошибки:", data);
        },
        error: function () {
            //console.log("Ошибка проверки проекта. data = ", data);
        }
    });
}

$(document).ready(function () {
    getScheme(); // воспроизводим схему из базы при открытии проекта
    $('#straight').trigger('click'); // делаем нажатой кнопку прямая
    $('#none').trigger('click'); // делаем нажатой кнопку сброс
    $('#floor_1').trigger('click'); // делаем нажатой кнопку уровень первого этажа
});

// предлагаем сохраниться перед закрытием
window.onbeforeunload = function (e) {
    if (schemeChange) {
        // Ловим событие для Interner Explorer 
        var e = e || window.event;
        var myMessage = "Вы действительно хотите покинуть страницу, не сохранив данные?";
        // Для Internet Explorer и Firefox 
        if (e) {
            e.returnValue = myMessage;
        }
        // Для Safari и Chrome 
        return myMessage;
    }
};

// создание фильтров по алгоритмам
function createFilters() {
    // algorithms = $('#filters').attr("name");
    // algorithms = JSON.parse(algorithms);
    // for (let algorithm of algorithms) {
    //     var input_id = algorithm.fields.identifier;
    //     var name = algorithm.fields.name;
    //     var container = $('#filters');
    //     $('<input />', { type: 'checkbox', id: input_id, class: 'alg_filter', checked: "checked", value: name }).appendTo(container);
    //     $('<label />', { 'for': input_id, text: name }).appendTo(container);
    // }
}

// отрабатываем нажатие кнопки расчета вариантов
$("#calculate").click(function () {

    // получаем все выбранные фильтры
    var arrayOfChecked = [];
    $('.alg_filter[type="checkbox"]:checked').each(function () {
        arrayOfChecked.push(this.id)
        ////console.log('arrayOfChecked = ', arrayOfChecked);    
    });

    // отправляем на сервер массив с выбранными фильтрами, в ответ получаем список посчитаных вариантов
    $.ajax({
        url: 'get_cost',
        type: 'GET',
        data: arrayOfChecked,
        cache: true,
        //async: false,
        success: function (data) {
            //console.log(" d = ", data);
        },
        error: function () {
            //console.log("Getting cost error. Scheme data = ", data);
        }
    });

});



/* <p>
    <input type="checkbox" checked name="html5" />HTML5
</p> */
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