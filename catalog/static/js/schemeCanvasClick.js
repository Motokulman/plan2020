var newLines = []; // массив новых линий
var newLinesIds = [];// массив, куда будут сохраняться id новых линий, а затем сохраняться в элементе
//***************************************************************
// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas_0.addEventListener('click', function (e) {
    schemeChange = true;
    var distance = 0; // если кривая, то см. ниже, если прямая то = 0

    var newElement = [];// элементы сначала создаем отдельно, т.к. они все разные, прописываем свойства для каждого, и лишь потом добавляем в массив.

    if (selectedTool != "none") {
        selectedElements = [];// зачистим массив выделеных элеиентов
    }
    switch (selectedTool) {
        case 'wall':
            newLinesIds = [];
            if (selectedLineType == 'straight') { // если выбран прямой тип линии

                if (prePointsMM.length == 0) { // если это первый клик в этом цикле рисования прямой стены
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                } else { // если это второй клик в этом цикле рисования прямой стены
                    pushPrePointMM(mmOfMousePos);
                    pushPoints(prePointsMM);
                    prePointsMM = [];
                    drawPoint(mousePos); // Нарисовали вторую точку
                    pushLine(findMaxId(points) - 1, findMaxId(points), 0, ''); // занесли в массив линий нашу новую линию
                    console.log("lines = ", lines);
                    newLinesIds[0] = findMaxId(lines);// занесли в промежуточный массив id единственной линии, которая будет храниться в данном элементе (т.к. это просто ровная стена)
                    newElement = { ids: newLinesIds, type: 'wall', subType: '' };
                    console.log("newElement = ", newElement);
                    pushElement(newElement); // занесли в массив с элементами id нашей линии стены/ радиус = 0 чтобы отличить стену от радиусного элемента
                    console.log("elements сразу после добавления = ", elements);
                    drawLine(lines[lines.length - 1], ctx_0, drawSettingsDefault);
                    newLinesIds = [];
                }

            } else if (selectedLineType == 'polygon') {
                newLinesIds = []; // если это многоугольник. У многоугольника всегда есть две начальные точки, которые могут совпадать если это один из углов многоугольника
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
                    pushLine(findMaxId(points) - 3, findMaxId(points) - 1, 0, ''); // занесли в массив линий нашу первую новую линию
                    pushLine(findMaxId(points) - 1, findMaxId(points), 0, ''); // занесли в массив линий нашу вторую новую линию
                    pushLine(findMaxId(points), findMaxId(points) - 2, 0, ''); // занесли в массив линий нашу третью новую линию
                    prePointsMM = [];
                    newLinesIds[0] = findMaxId(lines) - 2;
                    newLinesIds[1] = findMaxId(lines) - 1;
                    newLinesIds[2] = findMaxId(lines);
                    newElement = { ids: newLinesIds, distance: distance, type: 'wall', subType: '' };
                    pushElement(newElement);
                    drawElement(elements[elements.length - 1]);
                    mousePosArray = [];
                }
                // Рисуем кривую    
            } else if (selectedLineType == 'curve') {
                newLinesIds = [];
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
                } else {// третий клик задает направление выгиба окружности
                    pushPoints(prePointsMM);
                    var diameter = Math.round(Math.sqrt(Math.pow((prePointsMM[0].x - prePointsMM[1].x), 2) + Math.pow((prePointsMM[0].y - prePointsMM[1].y), 2))); // пусть пока это будет правильный полукруг
                    distance = diameter / 2;// определим расстояние от дальней точки окружности до базовой прямой. Этот способ позволяет хранить только это расстояние и направление. Для простоты оно равно радиусу, что нужно для правильного полукруга. Поэтому рано 0.
                    // определим по какую сторону от прямой кликнул пользователь. Если стоим на первой точке и смотрим на вторую. + значит слева, - справа
                    var d = (mmOfMousePos.x - prePointsMM[0].x) * (prePointsMM[1].y - prePointsMM[0].y) - (mmOfMousePos.y - prePointsMM[0].y) * (prePointsMM[1].x - prePointsMM[0].x)
                    if (d > 0) { //+ значит слева
                        // newElement = { ids: newLinesIds, distance: distance, direction: "left", type: 'wall', wallType: '' };
                        pushLine(findMaxId(points) - 1, findMaxId(points), distance, "left"); // занесли в массив линий нашу новую линию
                    } else {
                        // newElement = { ids: newLinesIds, distance: distance, direction: "right", type: 'wall', wallType: '' };
                        pushLine(findMaxId(points) - 1, findMaxId(points), distance, "right");
                    }
                    // newLinesIds[0] = findMaxId(lines);// занесли в промежуточный массив id единственной линии
                    // pushLine(findMaxId(points) - 1, findMaxId(points), 0, ''); // занесли в массив линий нашу новую линию
                    newLinesIds[0] = findMaxId(lines);// занесли в промежуточный массив id единственной линии
                    newElement = { ids: newLinesIds, type: 'wall', subType: '' }; // заносим линию в элемент
                    pushElement(newElement);
                    prePointsMM = [];
                    //  //console.log("elements = ", elements);
                    drawLine(lines[lines.length - 1], ctx_0, drawSettingsDefault);
                }
            }
            break;
        case 'none': // выделяем элементы кликами:
            var selectedEl = selectedElements.findIndex(sel => sel == defineElement()); // ищем элемент, на который только что кликнули, в массиве выделенных элементов
            ////console.log("defineElement() = ", defineElement());
            if (selectedEl >= 0) {
                // var a = selectedElements.findIndex(defineElement());
                selectedElements.splice(selectedEl, 1);
            } else {
                selectedElements.push(defineElement());
            }
            break;
        case 'entrance_group': // если входная группа. Ее вообще задавать точкой и направлением
            newLinesIds = [];
            if (prePointsMM.length > 0) {
                // pushPrePointMM(mmOfMousePos);
                // drawPoint(mousePos);
                // if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода группы
                //     pushPoints(prePointsMM);
                //     for (var p = prePointsMM.length - 1; p > 0; p--) {
                //         pushLine(findMaxId(points) - p, findMaxId(points) - p + 1); // занесли в массив линий нашу новую линию
                //         newLinesIds.push(findMaxId(lines));//
                //         // //console.log("lines = ", lines);
                //     }
                //     prePointsMM = [];
                //     newElement = { ids: newLinesIds, type: "Entrance group" };
                //     newLinesIds = [];
                //     pushElement(newElement);
                //     drawElements();
                // }
            } else { // если это самая первая точка
                // pushPrePointMM(mmOfMousePos);
                // drawPoint(mousePos);
            }
            break;
        case 'plate_garage': // пол гаража. Должен хранить ограничивающие его несущие стены. Потом определять автоматом, а пока сделать явный выбор стен.
            // pushPrePointMM(mmOfMousePos);
            // pushPoints(prePointsMM); // сохранили точку - метку того, что это помещение - гараж
            // plate_garage.push(findMaxId(points)); // занескли id метки-точки в массив гаражных полов
            // $('#none').trigger('click'); // делаем нажатой кнопку сброс
            ////console.log("plate_garage = ", plate_garage);
            break;
        case 'stairwell': // лестничный пролет. Можно по последовательности ввода определять направление движения. При обработке автоматически определять элементы, его окаймляющих, и соответственно обрабатывать. Например, окружность
            newLinesIds = [];
                        // console.log("stairwell!");
            // prePointsMM = []; // обнылим все на всякий случай
            // newLinesIds = [];
            if (prePointsMM.length > 0) {
                // var stairwellElement = [];
                pushPrePointMM(mmOfMousePos);
                // console.log("prePointsMM.length = ", prePointsMM.length);
                drawPoint(mousePos);
                // проверяем, не попалась ли нам окружность на этот раз. Тупо проверяем не попали ли на элемент целиком и тупо копируем его, линия, окружность - не важно
                var dist = 0;
                var dir = '';
                var newLine = [];
                if (elements.length > 0) {
                    for (element of elements.values()) { // бежим по всем имеющимся элементам
                        
                        var line = lines.find(line => line.id == element.ids[0]); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
                        var point0 = points.find(point => point.id == line.id0);
                        var point1 = points.find(point => point.id == line.id1); // нашли все точки имеющейся окружности и проверяем, не совпадают ли они с нашими
                        console.log("бежим по всем имеющимся элементам ");
                        console.log("point0 = ", point0);
                        console.log("point1 = ", point1);
                        console.log("prePointsMM[prePointsMM.length - 1].x = ", prePointsMM[prePointsMM.length - 1].x);
                        console.log("prePointsMM[prePointsMM.length - 1].y = ", prePointsMM[prePointsMM.length - 1].y);
                        console.log("prePointsMM[prePointsMM.length - 2].x = ", prePointsMM[prePointsMM.length - 2].x);
                        console.log("prePointsMM[prePointsMM.length - 2].y = ", prePointsMM[prePointsMM.length - 2].y);
                        if ((prePointsMM[prePointsMM.length - 1].x == point1.x) && (prePointsMM[prePointsMM.length - 1].y == point1.y) && (prePointsMM[prePointsMM.length - 2].x == point0.x) && (prePointsMM[prePointsMM.length - 2].y == point0.y)) {
                            dist = line.distance;
                            dir = line.direction;
                             console.log("окружность при вводе прямая ");
                        } else if ((prePointsMM[prePointsMM.length - 1].x == point0.x) && (prePointsMM[prePointsMM.length - 1].y == point0.y) && (prePointsMM[prePointsMM.length - 2].x == point1.x) && (prePointsMM[prePointsMM.length - 2].y == point1.y)) {
                            console.log("окружность при вводе обратная ");
                            dist = line.distance;
                            if (line.direction == "right") {
                                dir = "left";
                            } else {
                                dir = "right";
                            }
                        }
                    }
                    newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length, distance: dist, direction: dir };
                } else {
                    newLine = { p0_id: prePointsMM.length - 2, p1_id: prePointsMM.length - 1, distance: dist, direction: dir };
                }

                // pushLine(findMaxId(points) - 1, findMaxId(points), dist, dir); // занесли в массив линий нашу новую линию

                newLines.push(newLine);
                // newLinesIds.push(findMaxId(lines) + newLines.length); // занесли в промежуточный массив id линий

                if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода
                    pushPoints(prePointsMM);
                    for (line of newLines.values()) {
                        pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                        newLinesIds.push(findMaxId(lines));
                        console.log("lines = ", lines);
                    }
                    var newElement = { ids: newLinesIds, type: 'aperture', subType: 'stairwell' };
                    pushElement(newElement);
                    console.log("elements = ", elements);
                    console.log("points = ", points);
                    newLinesIds = [];
                    prePointsMM = [];
                    newLinesIds = [];
                    newLines = [];
                    drawShape(elements[elements.length - 1], ctx_0, drawSettingsDefault);
                    $('#none').trigger('click'); // делаем нажатой кнопку сброс
                }
            } else { // если это самая первая точка
                newLines = [];
                prePointsMM = [];
                newLinesIds = [];
                newLines = [];
                pushPrePointMM(mmOfMousePos);
                drawPoint(mousePos);

            }
            break;

    }
    // console.log("elements = ", elements);
});