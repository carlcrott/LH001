
jQuery.fn.submitWithAjax = function() {  
  $.post("/pages/step" , function(data){
    //nada
  });
};


$(document).ready(function() {
  $("#button_1").click(function(){
    $(this).submitWithAjax();
  });
});




