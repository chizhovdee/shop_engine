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

