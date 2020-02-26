// Определяем, какой элемент выбрал пользователь (стена или что-то иное)
$('#test_buttons button').click(function () {
    calc();
});

function calc() {
    var partition = { living: 0, uninhabited: 0 };
    var bearing = { living: 0, uninhabited: 0 };
    var fasade = 0;

    // получаем все данные из массива
    for (element of elements.values()) { // перебираем все элементы - прямые, эркеры, кривые
        var part = 0;
        var bear = 0;
        for (item of element.ids.values()) {
            var line = lines.find(line => line.id == item); // ищем в массиве линий линию, сооьветствующиему Id в данной итерации
            var point0 = points.find(point => point.id == line.id0);
            var point1 = points.find(point => point.id == line.id1);
            var length = lengthLine(point0, point1);
            if ((element.distance > 0) && (element.ids.length == 1)) { // если это окружность
                // ситаем длину окружности. так как пока наши окружности это правильные полуокружности, то
                length = length * 3.14 / 2;
            }
            // если ничего не задано
            if (element.bearType == "partition") {// если это перегородка
                part = length;
            } else if (element.bearType == "bearing") {// если это несущая стена
                bear = length;
                if (element.outdoorType == "outdoor") {
                    fasade = fasade + length;
                }
            }
            if (element.liveType == "living") {
                partition.living = partition.living + part;
                bearing.living = bearing.living + bear;
            } else if (element.liveType == "uninhabited") {
                partition.uninhabited = partition.uninhabited + part;
                bearing.uninhabited = bearing.uninhabited + bear;
            }
        }
        if (part + bear == 0) {
            console.log("Не задан тип стены по нагрузке: ", element);
        }
    }

    console.log("partition.living = ", partition.living);
    console.log("partition.uninhabited = ", partition.uninhabited);
    console.log("bearing.living = ", bearing.living);
    console.log("bearing.uninhabited = ", bearing.uninhabited);
    console.log("fasade = ", fasade);
}

// Попытка обновить ДОМ без перезагрузки  https://coderoad.ru/45906858/Обновление-DOM-без-перезагрузки-страницы-в-Django
$("#sender").click(function () {
    var input = $('#user-input').val();

    $.ajax({
        url: 'get_response',
        data: {
          'inputValue': input
        },
        dataType: 'json',
        success: function (data) {
            var grillages = JSON.parse(data);
          document.getElementById('p-text').innerHTML = grillages;
        }
      });
    });

// get existed grillages of this plan from DB
// function getGrillages() {
//     var data = {};
//     data.plan = plan_id;
//     var url = '/catalog/get_grillages/';
//     $.ajax({
//       url: url,
//       type: 'GET',
//       data: data,
//       cache: true,
//       async: false,
//       success: function (data) {
//         grillages = JSON.parse(data);
//         console.log("OK Getting grillages");
//         console.log("grillages = ", grillages);
//         document.dispatchEvent(getGrillagesEvent);//raise event when the reqiest recieved and we can draw existed elements 
//         drawGrillages();
//       },
//       error: function () {
//         console.log("Getting grillages error");
//       }
//     });
//   }