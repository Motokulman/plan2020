var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');
var selectedLineType = "straight"; // Тип линии при рисовании - прямая или кривая
var selectedTool = "none"; // Выбранный элемент для рисования, стена, или еще что-то. Изначально - ничего не выбрано
var mousePosArray = []; // массив позиций мыши при рисовании. 

// рисуем прямую линию или 
function drawLine() {
    ctx.beginPath();
    ctx.moveTo(mouseOldPos0.x, mouseOldPos0.y);
    ctx.lineTo(mousePos.x, mousePos.y);
    ctx.stroke();
  }


// В случае клика по канве определяем какой элемент хочет нарисовать пользователь и действуем
canvas.addEventListener('click', function (e) {
    switch(selectedTool){
        case 'wall' : 
            if (selectedLineType == 'straight') { // если выбран прямой тип линии
                if (mousePosArray.length == 0) { // если это первый клик в этом цикле рисования
                    mousePosArray[0] = 

                }

            } else {

            }
            console.log("Выбрана стена");
            break;
        case 'none' : 
            console.log("Ничего не выбрано");
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