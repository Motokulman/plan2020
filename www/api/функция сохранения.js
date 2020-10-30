// Итак, вот функция, которой я сохраняю схему. Я так полагаю, тебе надо ее поставить себе

function saveScheme() {
    var data = {};
    var d = {};
    console.log("elements при сохранении= ", elements)
    d.elements = elements;
    d.lines = lines;
    d.points = points;
    d.vents = vents;
    d.windows = windows;
    d.balconyGroups = balconyGroups;
    d.openings = openings;
    d.scale = scale;
    d.zeroPointPadding = zeroPointPadding;
    d = JSON.stringify(d);
    data.d = d;
    data.checked = false;
    data["csrfmiddlewaretoken"] = csrf_token;
    console.log("data до JSON = ", data)
    console.log("data после JSON, но до пересылки = ", data)
    $.ajax({
        url: 'get_response',
        type: 'POST',
        data: data,
        cache: false,
        async: false,
        success: function (data) {
            schemeChange = false;
            console.log("Схема сохранена = ", data);
        },
        error: function () {
            console.log("Ошибка сохранения схемы");
        }
    });
}

/* Касательно url
Моя переменная "url: 'get_response'" видится вреймворку как "plan/<int:pk>/edit_scheme/get_response" :

А именно так, код Python:
*/
urlpatterns += [
    path('plan/<int:pk>/edit_scheme/get_response',
         views.set_scheme, name='get_response'),
]
/*

где <int:pk> - id проекта

И полный путь выглядит, например, так:

http://87.236.23.29/catalog/plan/22/edit_scheme/

Теоретически, может и заработает, но возможно, попросит авторизацию как пользователя. Если так будет, буду думать дальше

*/