var newLines = []; // массив новых линий
var newLinesIds = [];// массив, куда будут сохраняться id новых линий, а затем сохраняться в элементе
//***************************************************************
// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas_0.addEventListener('click', function (e) {
    schemeChange = true;
    var distance = 0; // если кривая, то см. ниже, если прямая то = 0

    var newElement = [];// элементы сначала создаем отдельно, т.к. они все разные, прописываем свойства для каждого, и лишь потом добавляем в массив.

    if (action == "draw") {
        selectedElements = [];// зачистим массив выделеных элеиентов
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
                        drawPoint(mousePos); // Нарисовали вторую точку
                        pushLine(findMaxId(points) - 1, findMaxId(points), 0, ''); // занесли в массив линий нашу новую линию
                        // ////console.log("lines = ", lines);
                        newLinesIds[0] = findMaxId(lines);// занесли в промежуточный массив id единственной линии, которая будет храниться в данном элементе (т.к. это просто ровная стена)
                        newElement = { ids: newLinesIds, type: 'wall', subType: '', level: level, limitation: 10 };
                        // console.log("newElement = ", newElement);
                        pushElement(newElement); // занесли в массив с элементами id нашей линии стены/ радиус = 0 чтобы отличить стену от радиусного элемента
                        // ////console.log("elements сразу после добавления = ", elements);
                        drawLine(lines[lines.length - 1], ctx_0, drawSettingsDefault);
                        newLines = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];

                    }

                } else if (selectedLineType == 'polygon') { // Сделать первичным угловатый эркер, и преобразовывать его в круглый при кастомизации. Поскльку преобразование из круглого в угловатый слишком неопределенно
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
                        newLinesIds[0] = findMaxId(lines) - 2;
                        newLinesIds[1] = findMaxId(lines) - 1;
                        newLinesIds[2] = findMaxId(lines);
                        newElement = { ids: newLinesIds, distance: distance, type: 'wall', subType: '', level: level, limitation: 10 };
                        pushElement(newElement);
                        drawElement(elements[elements.length - 1]);
                        mousePosArray = [];
                        newLines = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
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
                        newElement = { ids: newLinesIds, type: 'wall', subType: '', level: level, limitation: 10 }; // заносим линию в элемент
                        pushElement(newElement);
                        newLines = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        //  //////console.log("elements = ", elements);
                        drawLine(lines[lines.length - 1], ctx_0, drawSettingsDefault);
                    }
                }
                break;
            case 'none':
                {

                }
                break;
            case 'entrance_group': //  входная группа. Может, Ее вообще задавать точкой и направлением. Или как свойство входной двери.
                newLinesIds = [];
                if (prePointsMM.length > 0) {
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода группы
                        pushPoints(prePointsMM);
                        for (var p = prePointsMM.length - 1; p > 0; p--) {
                            pushLine(findMaxId(points) - p, findMaxId(points) - p + 1, 0, ''); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));//
                            // //////console.log("lines = ", lines);
                        }
                        prePointsMM = [];
                        newElement = { ids: newLinesIds, level: level, type: "entrance_group" };
                        newLinesIds = [];
                        pushElement(newElement);
                        drawElements();
                    }
                } else { // если это самая первая точка
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                }
                break;
            case 'plate_garage': // пол гаража. Должен хранить ограничивающие его несущие стены. Потом определять автоматом, а пока сделать явный выбор стен.
                newLinesIds = [];
                if (prePointsMM.length > 0) {
                    pushPrePointMM(mmOfMousePos);
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
                            if ((prePointsMM[prePointsMM.length - 1].x == point1.x) && (prePointsMM[prePointsMM.length - 1].y == point1.y) && (prePointsMM[prePointsMM.length - 2].x == point0.x) && (prePointsMM[prePointsMM.length - 2].y == point0.y)) {
                                dist = line.distance;
                                dir = line.direction;
                                // ////console.log("окружность при вводе прямая ");
                                break;
                            } else if ((prePointsMM[prePointsMM.length - 1].x == point0.x) && (prePointsMM[prePointsMM.length - 1].y == point0.y) && (prePointsMM[prePointsMM.length - 2].x == point1.x) && (prePointsMM[prePointsMM.length - 2].y == point1.y)) {
                                // ////console.log("окружность при вводе обратная ");
                                dist = line.distance;
                                if (line.direction == "right") {
                                    dir = "left";
                                } else {
                                    dir = "right";
                                }
                                break;
                            }
                        }
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length, distance: dist, direction: dir };
                    } else {
                        newLine = { p0_id: prePointsMM.length - 2, p1_id: prePointsMM.length - 1, distance: dist, direction: dir };
                    }
                    newLines.push(newLine);
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода
                        pushPoints(prePointsMM);
                        for (line of newLines.values()) {
                            pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));
                        }
                        newElement = { ids: newLinesIds, type: 'floor', subType: 'garage' }; // , level: level 
                        pushElement(newElement);
                        newLinesIds = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        drawShape(elements[elements.length - 1], ctx_0, drawSettingsGarage);
                        $('#none').trigger('click'); // делаем нажатой кнопку сброс
                    }
                } else { // если это самая первая точка
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                }
                break;
            case 'stairwell': // лестничный пролет. Можно по последовательности ввода определять направление движения. При обработке автоматически определять элементы, его окаймляющих, и соответственно обрабатывать. Например, окружность
                newLinesIds = [];
                if (prePointsMM.length > 0) {
                    pushPrePointMM(mmOfMousePos);
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
                            if ((prePointsMM[prePointsMM.length - 1].x == point1.x) && (prePointsMM[prePointsMM.length - 1].y == point1.y) && (prePointsMM[prePointsMM.length - 2].x == point0.x) && (prePointsMM[prePointsMM.length - 2].y == point0.y)) {
                                dist = line.distance;
                                dir = line.direction;
                                // ////console.log("окружность при вводе прямая ");
                                break;
                            } else if ((prePointsMM[prePointsMM.length - 1].x == point0.x) && (prePointsMM[prePointsMM.length - 1].y == point0.y) && (prePointsMM[prePointsMM.length - 2].x == point1.x) && (prePointsMM[prePointsMM.length - 2].y == point1.y)) {
                                // ////console.log("окружность при вводе обратная ");
                                dist = line.distance;
                                if (line.direction == "right") {
                                    dir = "left";
                                } else {
                                    dir = "right";
                                }
                                break;
                            }
                        }
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length, distance: dist, direction: dir };
                    } else {
                        newLine = { p0_id: prePointsMM.length - 2, p1_id: prePointsMM.length - 1, distance: dist, direction: dir };
                    }
                    newLines.push(newLine);
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода
                        pushPoints(prePointsMM);
                        for (line of newLines.values()) {
                            pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));
                        }
                        newElement = { ids: newLinesIds, type: 'aperture', subType: 'stairwell' }; // , level: level 
                        pushElement(newElement);
                        newLinesIds = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        drawShape(elements[elements.length - 1], ctx_0, drawSettingsDefault);
                        $('#none').trigger('click'); // делаем нажатой кнопку сброс
                    }
                } else { // если это самая первая точка
                    pushPrePointMM(mmOfMousePos);
                    drawPoint(mousePos);
                }
                break;
            case 'roof': // кровля
                pushPrePointMM(mmOfMousePos);
                drawPoint(mousePos);
                // ////console.log("prePointsMM.length = ", prePointsMM.length);
                if (prePointsMM.length > 1) {// если точек две и более, формируем линии 
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) {// если точки совпали, значит конец ввода
                        var newLine = [];
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + 1 };
                        newLines.push(newLine);
                        prePointsMM.pop(); // удалим последний элемент массива точк, поскольку последняя точка равна первой
                        pushPoints(prePointsMM, true, false, false, 0); // кровлю задаем потом отдельно, поэтому по умолчанию пока поставим на первом этаже
                        // switch (level) { // в зависимости от текущего уровня сохраняем точки предустанавливая их высоту
                        //     case 'floor_1':
                        //         pushPoints(prePointsMM, true, false, false, 0);
                        //         break;
                        //     case 'floor_2':
                        //         pushPoints(prePointsMM, true, true, false, 0);
                        //         break;
                        //     case 'floor_3':
                        //         pushPoints(prePointsMM, true, true, true, 0);
                        //         break;
                        // }

                        for (line of newLines.values()) {
                            pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));
                        }
                        newElement = { ids: newLinesIds, type: 'roof' }; // , level: level 
                        pushElement(newElement);
                        newLinesIds = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        // ////console.log("points = ", points);
                        drawShape(elements[elements.length - 1], ctx_0, drawSettingsRoof);
                        $('#none').trigger('click'); // делаем нажатой кнопку сброс
                    } else {
                        var newLine = [];
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length };
                        newLines.push(newLine);
                        // ////console.log("newLine = ", newLine);
                    }
                } else { // если первый клик
                    // когда первый раз задаем скат, все точки на одном уровне. Но их высоту базово задаем от уровня пола 1 этажа в зависимости от того, на каком уровне первый раз кликнули

                    // ////console.log("roof_point_height = ", roof_point_height);
                }
                break;
            case 'window':
                var set = defineElement("wall");
                var l;
                var point0;
                var point1;
                var newWindow = [];
                newLinesIds = [];
                var elem = elements.find(element => element.id == set.element_id);
                var line = lines.find(line => line.id == set.line_id);
                // ////console.log("set = ", set);
                if ((typeof line != "undefined") && (elem.type == "wall")) {
                    for (line_id of elem.ids.values()) {
                        newLinesIds.push(line_id);
                    }
                    if (newLinesIds.length > 1) { // если это эркер - то есть линий в элементе больше чем одна, то тупо вставляем окно посередине  линии
                        point0 = points.find(point => point.id == line.id0);
                        point1 = points.find(point => point.id == line.id1);
                        l = lengthLine(point0, point1) / 2;
                        newWindow = { id: windows.length, line_id: line.id, distance: l, height: drawSettingsWindow.height, width: drawSettingsWindow.width, top: drawSettingsWindow.top };
                        windows.push(newWindow);
                        var middlePoint = lineMiddle(point0, point1);
                        middlePoint = mmToPix(middlePoint);
                        drawWindow(middlePoint.x, middlePoint.y, ctx_0, drawSettingsWindow);
                    } else { // если этот элемент состоит из одной линии, тогда вставляем окно туда, куда ткнул пользователь
                        line = lines.find(line => line.id == newLinesIds[0]);
                        point0 = points.find(point => point.id == line.id0);
                        l = lengthLine(point0, mmOfMousePos); // пока такой вариант: не доли и не проценты, а точное расстояние, т.к. если пользователь точно введет это расстояние, оно должно сохраниться как миллиметры
                        // ////console.log("item = ", item);
                        newWindow = { id: windows.length, line_id: line.id, distance: l, height: drawSettingsWindow.height, width: drawSettingsWindow.width, top: drawSettingsWindow.top };
                        windows.push(newWindow);
                        drawWindow(mousePos.x, mousePos.y, ctx_0, drawSettingsWindow);
                    }
                    ////console.log("windows = ", windows);
                    // появилась такая мысль, изначально рисовать только угловатые эркеры, и переводить их в круглые в кастомизации. Окна в круглых расставлять автоматом, че мучаться то. Поэтому здесь не обрабатываем.
                    // появилась вторая мысль, что при создании любого эркера окна в них создавать автоматом
                    newLinesIds = [];
                    newWindow = [];
                }
                break;
            case 'balcony_group':
                var set = defineElement("wall");
                var l;
                var point0;
                var point1;
                var line;
                var newDoorWindow = [];
                var elem = elements.find(element => element.id == set.element_id);
                var line = lines.find(line => line.id == set.line_id);
                if ((typeof line != "undefined") && (elem.type == "wall")) {
                    point0 = points.find(point => point.id == line.id0);
                    l = lengthLine(point0, mmOfMousePos); // пока такой вариант: не доли и не проценты, а точное расстояние, т.к. если пользователь точно введет это расстояние, оно должно сохраниться как миллиметры
                    // ////console.log("item = ", item);
                    newDoorWindow = { line_id: line.id, distance: l, settings: balconyGroupDefault };
                    balconyGroups.push(newDoorWindow);
                    drawBalconyGroup(mousePos.x, mousePos.y, ctx_0, drawSettingsWindow);
                }
                break;
            case 'opening':
                var set = defineElement("wall");
                var l;
                var point0;
                var point1;
                var line;
                var newOpening = [];
                var elem = elements.find(element => element.id == set.element_id);
                var line = lines.find(line => line.id == set.line_id);
                if ((typeof line != "undefined") && (elem.type == "wall")) {
                    point0 = points.find(point => point.id == line.id0);
                    l = lengthLine(point0, mmOfMousePos); // пока такой вариант: не доли и не проценты, а точное расстояние, т.к. если пользователь точно введет это расстояние, оно должно сохраниться как миллиметры
                    // ////console.log("item = ", item);
                    newOpening = { line_id: line.id, distance: l, settings: openingDefault };
                    openings.push(newOpening);
                    drawOpening(mousePos.x, mousePos.y, ctx_0, drawSettingsOpening);
                }
                break;
            case 'door': // автоматически определять тип двери исходя из типа стены
                var set = defineElement("wall");
                var l;
                var point0;
                var point1;
                var line;
                var newDoor = [];
                var elem = elements.find(element => element.id == set.element_id);
                var line = lines.find(line => line.id == set.line_id);
                if ((typeof line != "undefined") && (elem.type == "wall")) {
                    point0 = points.find(point => point.id == line.id0);
                    l = lengthLine(point0, mmOfMousePos); // пока такой вариант: не доли и не проценты, а точное расстояние, т.к. если пользователь точно введет это расстояние, оно должно сохраниться как миллиметры
                    // ////console.log("item = ", item);
                    newDoor = { line_id: line.id, distance: l, settings: doorDefault };
                    doors.push(newDoor);
                    drawDoor(mousePos.x, mousePos.y, ctx_0, drawSettingsDoor);
                }
                break;
            case 'indoor_plate': // внутреннее перекрытие. Рисоватьтак, чтобы первая линия была опорной
                newLinesIds = [];
                if (prePointsMM.length > 0) {
                    pushPrePointMM(mmOfMousePos);
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
                            if ((prePointsMM[prePointsMM.length - 1].x == point1.x) && (prePointsMM[prePointsMM.length - 1].y == point1.y) && (prePointsMM[prePointsMM.length - 2].x == point0.x) && (prePointsMM[prePointsMM.length - 2].y == point0.y)) {
                                dist = line.distance;
                                dir = line.direction;
                                // ////console.log("окружность при вводе прямая ");
                                break;
                            } else if ((prePointsMM[prePointsMM.length - 1].x == point0.x) && (prePointsMM[prePointsMM.length - 1].y == point0.y) && (prePointsMM[prePointsMM.length - 2].x == point1.x) && (prePointsMM[prePointsMM.length - 2].y == point1.y)) {
                                // ////console.log("окружность при вводе обратная ");
                                dist = line.distance;
                                if (line.direction == "right") {
                                    dir = "left";
                                } else {
                                    dir = "right";
                                }
                                break;
                            }
                        }
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length, distance: dist, direction: dir };
                    } else {
                        newLine = { p0_id: prePointsMM.length - 2, p1_id: prePointsMM.length - 1, distance: dist, direction: dir };
                    }
                    newLines.push(newLine);
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода
                        pushPoints(prePointsMM);
                        for (line of newLines.values()) {
                            pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));
                        }
                        newElement = { ids: newLinesIds, type: 'indoor_plate', level: level }; // , level: level 
                        pushElement(newElement);
                        newLinesIds = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        drawShape(elements[elements.length - 1], ctx_0, drawSettingsOutdoorPlate);
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
            case 'outdoor_plate': // перекрытие открытого пространства: балкон, веранда, лоджия и т.д. В зависимости от контекста
                newLinesIds = [];
                if (prePointsMM.length > 0) {
                    pushPrePointMM(mmOfMousePos);
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
                            if ((prePointsMM[prePointsMM.length - 1].x == point1.x) && (prePointsMM[prePointsMM.length - 1].y == point1.y) && (prePointsMM[prePointsMM.length - 2].x == point0.x) && (prePointsMM[prePointsMM.length - 2].y == point0.y)) {
                                dist = line.distance;
                                dir = line.direction;
                                // ////console.log("окружность при вводе прямая ");
                                break;
                            } else if ((prePointsMM[prePointsMM.length - 1].x == point0.x) && (prePointsMM[prePointsMM.length - 1].y == point0.y) && (prePointsMM[prePointsMM.length - 2].x == point1.x) && (prePointsMM[prePointsMM.length - 2].y == point1.y)) {
                                // ////console.log("окружность при вводе обратная ");
                                dist = line.distance;
                                if (line.direction == "right") {
                                    dir = "left";
                                } else {
                                    dir = "right";
                                }
                                break;
                            }
                        }
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length, distance: dist, direction: dir };
                    } else {
                        newLine = { p0_id: prePointsMM.length - 2, p1_id: prePointsMM.length - 1, distance: dist, direction: dir };
                    }
                    newLines.push(newLine);
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода
                        pushPoints(prePointsMM);
                        for (line of newLines.values()) {
                            pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));
                        }
                        newElement = { ids: newLinesIds, type: 'outdoor_plate', level: level }; // , level: level 
                        pushElement(newElement);
                        newLinesIds = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        drawShape(elements[elements.length - 1], ctx_0, drawSettingsOutdoorPlate);
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
            case 'vent':
                var set = defineElement("wall");
                var l;
                var point0;
                var point1;
                var line;
                var newVent = [];
                var elem = elements.find(element => element.id == set.element_id);
                var line = lines.find(line => line.id == set.line_id);
                if ((typeof line != "undefined") && (elem.type == "wall")) {
                    point0 = points.find(point => point.id == line.id0);
                    l = lengthLine(point0, mmOfMousePos); // пока такой вариант: не доли и не проценты, а точное расстояние, т.к. если пользователь точно введет это расстояние, оно должно сохраниться как миллиметры
                    // ////console.log("item = ", item);
                    newVent = { line_id: line.id, distance: l, settings: ventDefault };
                    vents.push(newVent);
                    drawVent(mousePos.x, mousePos.y, ctx_0, drawSettingsVent);
                }
                break;
            case 'steps': // ступеньки при входе в дом
                newLinesIds = [];
                if (prePointsMM.length > 0) {
                    pushPrePointMM(mmOfMousePos);
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
                            if ((prePointsMM[prePointsMM.length - 1].x == point1.x) && (prePointsMM[prePointsMM.length - 1].y == point1.y) && (prePointsMM[prePointsMM.length - 2].x == point0.x) && (prePointsMM[prePointsMM.length - 2].y == point0.y)) {
                                dist = line.distance;
                                dir = line.direction;
                                // ////console.log("окружность при вводе прямая ");
                                break;
                            } else if ((prePointsMM[prePointsMM.length - 1].x == point0.x) && (prePointsMM[prePointsMM.length - 1].y == point0.y) && (prePointsMM[prePointsMM.length - 2].x == point1.x) && (prePointsMM[prePointsMM.length - 2].y == point1.y)) {
                                // ////console.log("окружность при вводе обратная ");
                                dist = line.distance;
                                if (line.direction == "right") {
                                    dir = "left";
                                } else {
                                    dir = "right";
                                }
                                break;
                            }
                        }
                        newLine = { p0_id: findMaxId(points) + prePointsMM.length - 1, p1_id: findMaxId(points) + prePointsMM.length, distance: dist, direction: dir };
                    } else {
                        newLine = { p0_id: prePointsMM.length - 2, p1_id: prePointsMM.length - 1, distance: dist, direction: dir };
                    }
                    newLines.push(newLine);
                    if ((prePointsMM[0].x == mmOfMousePos.x) && (prePointsMM[0].y == mmOfMousePos.y)) { // если точки совпали, значит конец ввода
                        pushPoints(prePointsMM);
                        for (line of newLines.values()) {
                            pushLine(line.p0_id, line.p1_id, line.distance, line.direction); // занесли в массив линий нашу новую линию
                            newLinesIds.push(findMaxId(lines));
                        }
                        newElement = { ids: newLinesIds, type: 'steps', level: level }; // , level: level 
                        pushElement(newElement);
                        newLinesIds = [];
                        prePointsMM = [];
                        newLinesIds = [];
                        newLines = [];
                        drawShape(elements[elements.length - 1], ctx_0, drawSettingsSteps);
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
    } else if (action == "none") {

        // выделяем элементы кликами:
        switch (selectedTool) {
            case 'wall':// если это стены, то алгоритм такой: клик - выделили, клик на ней же - сняли выделение
                var el = defineElement("wall");
                if (el.element_id > -1) { // реагируем только на стены
                    var selectedEl = selectedElements.findIndex(sel => sel == el.element_id); // ищем элемент, на который только что кликнули, в массиве выделенных элементов
                    if (selectedEl >= 0) {
                        selectedElements.splice(selectedEl, 1);
                    } else {
                        selectedElements.push(el.element_id);
                    }
                } else {
                    selectedElements = []; // если кликнули сбоку, все сбрасываем
                }
                break;
            case 'roof': // если кровля, то клик - выделили, клик - выделили точку. Клик не на кровле - сброс всего
                var el = defineElement("roof");
                ////console.log("el = ", el);
                if (el.element_id > -1) {
                    if ((el.point_id == -1) || (selectedElements.length == 0)) { // попали на скат кровли, но не на точку, или попали и на точку тоже, но при этом ни одного ската не выбрано, то выбираем скат
                        var selectRoof = selectedElements.findIndex(sel => sel == el.element_id); // ищем элемент, на который только что кликнули, в массиве выделенных элементов
                        if (selectRoof == -1) {// добавляем только если его еще нет
                            selectedElements.push(el.element_id);
                        }
                    } else { // если у нас выбран хоть один скат и мы попали на точку
                        var def_el = defineElement("roof", selectedElements[0]);
                        //console.log("def_el = ", def_el);
                        var selectPoint = selectedPoints.findIndex(sel => sel == def_el.point_id); // ищем элемент, на который только что кликнули, в массиве выделенных элементов
                        if (selectPoint >= 0) { // вариант когда повторным кликом удаляем выделенную точку
                            selectedPoints.splice(selectPoint, 1);
                        } else {
                            if (selectedPoints.length < 3) selectedPoints.push(def_el.point_id); // не даем выделять более 3-х точек
                        }
                    }
                } else { // если кликнули сбоку, то сброс. Именно сбоку, а не на другом элементе! поскольку другим элементом м.б. элемент с той же точкой
                    selectedElements = [];
                    selectedPoints = [];
                }
                drawElements();
                break;
            case 'entrance_group':
                // console.log("default = ");
                var el = defineElement('entrance_group');
                console.log("el = ", el);
                if (el.element_id > -1) { // реагируем только на стены
                    var selectedEl = selectedElements.findIndex(sel => sel == el.element_id); // ищем элемент, на который только что кликнули, в массиве выделенных элементов
                    if (selectedEl >= 0) {
                        selectedElements.splice(selectedEl, 1);
                    } else {
                        selectedElements.push(el.element_id);
                    }
                } else {
                    selectedElements = []; // если кликнули сбоку, все сбрасываем
                }
                break;
        }
        console.log("selectedElements = ", selectedElements);

    } else if (action == "limitation") { // Обрезаем стены на уровне выбранного этажа
        // console.log("action = ", action);
        if (level > 1) { // обрезаем только если это выше первого этажа
            var el = defineElement("wall");
            // console.log("defined el = ", el);
            if (el.element_id > -1) { // реагируем только на стены
                var elem = elements.find(element => element.id == el.element_id);
                elem.limitation = level; // ограничиваем текущим уровнем
                // console.log("elem = ", elem);
            }
        }
    }
    else if (action == "side_alignment") { // выравнивание стороны стены по стороне другой стены
        if (defineElement(selectedTool).element_id > -1) { // если мы попали наа элемент
            // console.log("selectedLines = ", selectedLines);
            if (selectedLines.length < 2) {
                var id = defineElement(selectedTool).line_id;
                console.log("selectedTool = ", selectedTool);
                console.log("defineElement(selectedTool) = ", defineElement(selectedTool));
                var li = lines.find(line => line.id == id);
                selectedLines.push(li);
                console.log("selectedLines = ", selectedLines);
            }
            if (selectedLines.length == 2) { // если выбраны две стены
                readyForAlignment = true;
                // console.log("selectedLines = ", selectedLines);
            }
        } else { // если кликнули сбоку, то сброс. 
            selectedLines = [];
            $('#none').trigger('click'); // делаем нажатой кнопку сброс
            readyForAlignment = false;
        }

        console.log("readyForAlignment  = ", readyForAlignment);
    }


    // ////console.log("elements = ", elements);
});