var canvas = document.getElementById('canvas');
var stick_lines_canvas = document.getElementById('stick_layer');
var ctx = canvas.getContext('2d');
var stick_lines_ctx = stick_lines_canvas.getContext('2d');
var selectedLineType = "straight"; // Тип линии при рисовании - прямая или кривая
var selectedTool = "none"; // Выбранный элемент для рисования, стена, или еще что-то. Изначально - ничего не выбрано
var mousePosArray = []; // массив позиций мыши при рисовании. 
var mousePos; // Позиции мыши по х и у, с учетом положения канвы на экране
var points = []; // Массив точек в миллиметрах. Первая точка - точка отсчета, начало коопдинат
var zeroPointPadding = []; // Смещение начала координат схемы относительно начала координат канвы. Попробуем в мм.
var walls = []; // Массив стен
var scaling = 25; // Сделать получение из настроек и сохранение в них


// рисуем прямую линию или 
function drawLine(p, p1) {
    ctx.beginPath();
    ctx.moveTo(p.x, p.y);
    ctx.lineTo(p1.x, p1.y);
    ctx.fillStyle = '#333333';
    ctx.stroke();
}

// рисуем точку
function drawPoint(p) {
    ctx.beginPath();
    ctx.arc(p.x, p.y, 5, 0, 2 * Math.PI);
    ctx.fillStyle = '#333333';
    ctx.fill();
    ctx.closePath();
}


// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas.addEventListener('click', function (e) {
    if (selectedTool != 'none') { // если хоть что то выбрано
        if (points.length == 0) { // если это первая точка в схеме, то она становится центром координат
            points.push([0, 0]);
            zeroPointPadding.x = mousePos.x * scaling;
            zeroPointPadding.y = mousePos.y * scaling;
            //console.log("zeroPointPadding = ", zeroPointPadding);
        } else {
            points.push([mousePos.x * scaling - zeroPointPadding.x, mousePos.y * scaling - zeroPointPadding.y]); // переводим в мм и вносим в массив
        }
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
                    mousePosArray[1] = getMousePos(canvas, e);
                    drawPoint(mousePosArray[1]); // Нарисовали вторую точку
                    drawLine(mousePosArray[0], mousePosArray[1]); // Нарисовали прямую
                    walls.push([mousePosArray[0], mousePosArray[1], null]); // Заносим стену в массив стен
                    mousePosArray = []; // Обнуляем массив
                    console.log("walls = ", walls);
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
function getMousePos(canvas, e) {
    var rect = canvas.getBoundingClientRect();
    return {
        x: e.clientX - Math.round(rect.left),
        y: e.clientY - Math.round(rect.top)
    };
}

// Определяем координаты курсора
canvas.addEventListener('mousemove', function (e) {
    mousePos = getMousePos(canvas, e);
    //console.log("mousePos = ", mousePos);
});

// Приклеиваем координаты к уже имеющимся точкам
// function sticking() {
//     for (item of walls.values()) { // перебор стен в массиве стен * (см. сноску внизу)
//         if (mousePos.x == item)
//     }
// }


//   function sticking(canvas, e, data) {
//     mousePos = getMousePos(canvas, e);
//     var flagX = false;
//     var flagY = false;
//     // Sticking to horizont and vertical
//     if (running) {
//       if (Math.abs(mousePos.x - mouseOldPos0.x) <= stickPixels) {
//         mousePos.x = mouseOldPos0.x;
//         flagX = true;
//       }
//       if (Math.abs(mousePos.y - mouseOldPos0.y) <= stickPixels) {
//         mousePos.y = mouseOldPos0.y;
//         flagY = true;
//       }
//     }
//     // Sticking to other points
//     // for (item of existedElements.values()) {
//     //   if (Math.abs(mousePos.x - item.fields.x0 / scale - paddingX) <= stickPixels) {
//     //     mousePos.x = item.fields.x0 / scale + paddingX;
//     //     flagX = true;
//     //   } else if (Math.abs(mousePos.x - item.fields.x1 / scale - paddingX) <= stickPixels) {
//     //     mousePos.x = item.fields.x1 / scale + paddingX;
//     //     flagX = true;
//     //   }
//     //   if (Math.abs(mousePos.y - item.fields.y0 / scale - paddingY) <= stickPixels) {
//     //     mousePos.y = item.fields.y0 / scale + paddingY;
//     //     flagY = true;
//     //   } else if (Math.abs(mousePos.y - item.fields.y1 / scale - paddingY) <= stickPixels) {
//     //     mousePos.y = item.fields.y1 / scale + paddingY;
//     //     flagY = true;
//     //   }
//     // }
//     // draw guidelines
//     if (flagX || flagY) {
//       ctx.lineWidth = guideLineWidth;
//       ctx.setLineDash([10, 5]);
//       ctx.lineWidth = 1;
//       if (flagX) {
//         ctx.beginPath();
//         ctx.moveTo(mousePos.x, 0);
//         ctx.lineTo(mousePos.x, canvas.height);
//         ctx.stroke();
//       }
//       if (flagY) {
//         ctx.beginPath();
//         ctx.moveTo(0, mousePos.y);
//         ctx.lineTo(canvas.width, mousePos.y);
//         ctx.stroke();
//       }
//       ctx.setLineDash([0, 0]);
//     }
//   }

