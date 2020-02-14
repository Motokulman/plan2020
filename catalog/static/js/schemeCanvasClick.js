//***************************************************************
// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas_0.addEventListener('click', function (e) {
    var newLinesIds = [];// массив, куда будут сохраняться id новых линий, а затем сохраняться в элементе
    var newElement = [];// элементы сначала создаем отдельно, т.к. они все разные, прописываем свойства для каждого, и лишь потом добавляем в массив.
    if (selectedTool != "none") {
        selectedElements = [];// зачистим массив выделеных элеиентов
    }
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
            var selectedEl = selectedElements.findIndex(sel => sel == defineElement()); // ищем элемент, на который только что кликнули, в массиве выделенных элементов
            console.log("defineElement() = ", defineElement());
            if (selectedEl >= 0) {
                // var a = selectedElements.findIndex(defineElement());
                selectedElements.splice(selectedEl, 1);
            } else {
                selectedElements.push(defineElement());
            }
            break;
        case 'entrance_group': // если входная группа
            if (prePointsMM.length > 0) {
                pushPrePointMM(mmOfMousePos);
                drawPoint(mousePos);
                if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода группы
                    
                    pushPoints(prePointsMM);
                    for (var p = prePointsMM.length - 1; p > 0; p--) {
                        pushLine(findMaxId(points) - p, findMaxId(points) - p + 1); // занесли в массив линий нашу новую линию
                        newLinesIds.push(findMaxId(lines));//
                        console.log("lines = ", lines);
                    }
                    prePointsMM = [];

                    newElement = { ids: newLinesIds, type: "Entrance group" };
                    newLinesIds = [];
                    pushElement(newElement);
                    drawElements();
                }
            } else {
                pushPrePointMM(mmOfMousePos);
                drawPoint(mousePos);
            }
            break;
    }
    //console.log("elements = ", elements);
});