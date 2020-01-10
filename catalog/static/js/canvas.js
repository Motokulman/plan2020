var canvas_0 = document.getElementById('canvas_0');
var canvas_1 = document.getElementById('canvas_1');
var ctx_0 = canvas_0.getContext('2d');
var ctx_1 = canvas_1.getContext('2d');
var selectedLineType = "straight"; // Тип линии при рисовании - прямая или кривая
var selectedTool = "none"; // Выбранный элемент для рисования, стена, или еще что-то. Изначально - ничего не выбрано
var mousePosArray = []; // массив позиций мыши при рисовании. 
var mousePos; // Позиции мыши по х и у, с учетом положения канвы на экране
var points = []; // Массив точек в миллиметрах. Первая точка - точка отсчета, начало коопдинат
var zeroPointPadding = []; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var walls = []; // Массив стен
var scaling = 25; // Сделать получение из настроек и сохранение в них
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
        ctx_1.lineTo(canvas_0.width, mousePos.y);
    } else if (type == "v") {
        ctx_1.moveTo(mousePos.x, 0);
        ctx_1.lineTo(mousePos.x, canvas_0.height);
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
            points.push([0, 0, 0]);
            zeroPointPadding.x = mousePos.x;
            zeroPointPadding.y = mousePos.y;
            empty_scheme = false;
            //console.log("zeroPointPadding = ", zeroPointPadding);
        } else {
            points.push([points[points.length - 1][0] + 1, (mousePos.x - zeroPointPadding.x) * scaling, (mousePos.y - zeroPointPadding.y) * scaling]); // переводим в мм и вносим в массив
            //  console.log("points = ", points);
        }
        stick();
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
                    //console.log("walls = ", walls);
                }
            } else { // если это не прямая

            }
            //console.log("Выбрана стена");
            break;  
        case 'none':
            //console.log("Ничего не выбрано");
            break;
    }
});

// функция очистки канвы
function clear(context, canvas) {
    context.fillStyle = 'rgba(255, 255, 255, 1)';
    context.fillRect(0, 0, canvas_0.width, canvas_0.height);
}

// Приклейка
function stick() {
    var stick_pix = 3;
    clear(ctx_1, canvas_1);
    // Перебор всех точек
    for (item of points.values()) {
        var a = [];
        a.x = item[1] / scaling + zeroPointPadding.x;
        a.y = item[2] / scaling + zeroPointPadding.y;
        if (Math.abs(mousePos.x - a.x) <= stick_pix) {
            mousePos.x = a.x;
            drawHVLine("v");
        }
        if (Math.abs(mousePos.y - a.y) <= stick_pix) {
            mousePos.y = a.y;
            drawHVLine("h");
        }
    }
}


// Проверочные действия
$('#test_buttons button').click(function () {
    clear(ctx_0, canvas_0);
    for (item of walls.values()) {
        var a = [];
        var b = [];
        a.x = item[0][0] / scaling + zeroPointPadding.x;
        a.y = item[0][1] / scaling + zeroPointPadding.y;
        b.x = item[1][0] / scaling + zeroPointPadding.x;
        b.y = item[1][1] / scaling + zeroPointPadding.y;
        console.log("a = ", a);
        console.log("b = ", b);
        drawLine(a, b, ctx_0);
    }
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
    stick();
    //console.log("mousePos 0= ", mousePos);
});


