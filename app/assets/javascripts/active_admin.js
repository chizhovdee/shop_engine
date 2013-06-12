//= require active_admin/base

$(function(){

  $("#index_table_item_pictures").find('input[name=main]').bind("change", function(){
    var picture_id = $(this).val();

    $.ajax({
      type: "PUT",
      url: "/admin/items/2/item_pictures/" + picture_id + "/mark_as_main",
      success: function(data){
        alert(data);
      },
      dataType: 'text'
    });
  })

});

var AdminOrder = {
  blink: null,
  setup: function(){

    setInterval(function(){

      $.getJSON("/admin/order_status", function(data){
        if(data.new_order){
          $("#new_order_message").show();
          $("title").text("Новый заказ на сайте!!!");
          
          if(!AdminOrder.blink){
            AdminOrder.blink = setInterval(AdminOrder.blinkOrder, 1000);
          }
        }
      });

    }, 20000);
  },

  blinkOrder: function() {
    if($("#new_order_message .text").hasClass('blink')){
      $("#new_order_message .text").removeClass('blink').hide();
      $("title").text("Toy Dream");
    } else {
      $("#new_order_message .text").addClass('blink').show();
      $("title").text("Новый заказ на сайте!!!");
    }
  }
};

