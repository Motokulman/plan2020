function getFundament() {
    var fundament = [];
    if (elements.length > 0) {
        for (element of elements.values()) {// перебираем все элементы 
            if (((element.type == "wall") && (element.level == 1)) || (element.type == "entrance_group")) { // нас интересуют только несущие стены на первом этаже
                for (line_id of element.ids.values()) {// перебираем массив id линий, хранящийся в каждом элементе
                    var line = lines.find(line => line.id == line_id);
                    var point0 = {
                        x: points.find(point => point.id == line.id0).x,
                        y: points.find(point => point.id == line.id0).y
                    }
                    var point1 = {
                        x: points.find(point => point.id == line.id1).x,
                        y: points.find(point => point.id == line.id1).y
                    }
                    var width = 0;
                    console.log("element = ", element);
                    if (( typeof (element.subType) != "undefined") && (element.subType.indexOf("outdoor") >= 0)) {// если это наружная несущая стена 
                        width = bearingOutdoorWidth;
                    } else {
                        width = bearingIndoorWidth;
                    }
                    fundament.push({ id: line.id, point0: point0, point1: point1, width: width, alignmentThisSide: line.alignmentThisSide, alignmentId: line.alignmentId, alignmentOtherSide: line.alignmentOtherSide, width: width });
                    // if (get_ribbon_fundament_cost)
                }
            }
        }
    }
    jsonFundament(fundament);
    return fundament;
}

function jsonFundament(fundament) {
    var data = {};
    var d = {};
    console.log("До JSON = ", fundament);
    d = JSON.stringify(fundament);
    data.d = d;
    data["csrfmiddlewaretoken"] = csrf_token;
    // console.log("data до JSON = ", data);
    console.log("после JSON = ", data);
    var elem1 = document.getElementById('elem');
    elem1.innerHTML = d;
}
