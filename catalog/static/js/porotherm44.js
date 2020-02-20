// function calcPorotherm() {
//     for (element of elements.values()) { // перебираем все элементы - прямые, эркеры, кривые
//         if ((element.distance > 0) && (element.ids.length == 1)) { // если это окружность
//             ctx_0.lineWidth = 1; 
//             strokeStyle = "black";// если ничего не задано
//            // drawCircleElement(element, ctx_0, strokeStyle); 
//             if (element.bearType == "partition") {// если это перегородка
//                 ctx_0.lineWidth = 6;
//                 strokeStyle = "black"
//                 drawCircleElement(element, ctx_0, strokeStyle);
//                 ctx_0.lineWidth = 2;
//             } else if (element.bearType == "bearing") {// если это несущая стена
//                 ctx_0.lineWidth = 12;
//                 strokeStyle = "black"
//                 drawCircleElement(element, ctx_0, strokeStyle);
//                 if (element.outdoorType == "outdoor") {
//                     ctx_0.lineWidth = 10;
//                     strokeStyle = "orange"
//                     drawCircleElement(element, ctx_0, strokeStyle);
//                 }
//             }
//             ctx_0.lineWidth = 4;
//             if (element.liveType == "living") {
//                 strokeStyle = "yellow";
//             } else if (element.liveType == "uninhabited") {
//                 strokeStyle = "Gainsboro";
//             }
//             drawCircleElement(element, ctx_0, strokeStyle);
//         } else {
//             for (item of element.ids.values()) { // перебираем массив id линий, хранящийся в каждом элементе
//                 var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
//                 var point0 = mmToPix(points.find(point => point.id == line.id0)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
//                 var point1 = mmToPix(points.find(point => point.id == line.id1)); // ищем и заносим в первую точку для рисования линии id первой точки сразу переводя в пиксели
//                 ctx_0.lineWidth = 1;
//                 strokeStyle = "black";// если ничего не задано
//             //    drawLine(point0, point1, ctx_0, strokeStyle);
//                 if (element.bearType == "partition") {// если это перегородка
//                     ctx_0.lineWidth = 6;
//                     strokeStyle = "black"
//                     drawLine(point0, point1, ctx_0, strokeStyle);
//                     ctx_0.lineWidth = 2;
//                 } else if (element.bearType == "bearing") {// если это несущая стена
//                     ctx_0.lineWidth = 12;
//                     strokeStyle = "black"
//                     drawLine(point0, point1, ctx_0, strokeStyle);
//                     if (element.outdoorType == "outdoor") {
//                         ctx_0.lineWidth = 10;
//                         strokeStyle = "orange"
//                         drawLine(point0, point1, ctx_0, strokeStyle);
//                     }
//                 }
//                 ctx_0.lineWidth = 4;
//                 if (element.liveType == "living") {
//                     strokeStyle = "yellow";
//                 } else if (element.liveType == "uninhabited") {
//                     strokeStyle = "Gainsboro";
//                 }
//                 drawLine(point0, point1, ctx_0, strokeStyle);
//             }
//         }

//     }
// }