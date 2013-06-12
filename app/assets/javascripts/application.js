// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
// require twitter/bootstrap
//= require fancybox
//= require jquery.cycle.lite
//= require_self


var Items = {
  setup: function(){
    var item_groups = $("#items").find(".item_group");
    var max_height;
    var klasses = ['name', 'description', 'current_price', 'old_price'];
    var item_group;

    item_groups.map(function(){
      item_group = $(this);

      $.map(klasses, function(klass){
        elements = item_group.find("." + klass);

        max_height = elements.map(function(){
          return $(this).outerHeight();
        }).toArray().sort(function(i,j){ return i > j ? -1 : 1; })[0];

        elements.height(max_height);
      });
    });
  }
};

var NavCatalogList = {
  setup: function(){
    $(".nav-catalog-list li a").hover(
      function(){
        $(this).parents("li").find(".inner-catalog").show();
      },

      function(){
        $(this).parents("li").find(".inner-catalog").hide();
      }
    );
  }
};

$(function(){
  $(".various").fancybox({
    // maxWidth  : 600,
    maxHeight : 570,
    width: 550,
    fitToView : false,
    // width   : '70%',
    // height    : '70%',
    autoSize  : false,
    autoResize: true,
    closeClick  : false,
    openEffect  : 'fade',
    closeEffect : 'fade',
    scrolling   : 'no'
  });
});

$(function(){
  $(".various1").fancybox({
    // maxWidth  : 600,
    maxHeight : 450,
    width: 550,
    fitToView : false,
    // width   : '70%',
    // height    : '70%',
    autoSize  : false,
    autoResize: true,
    closeClick  : false,
    openEffect  : 'fade',
    closeEffect : 'fade',
    scrolling   : 'no'
  });
});
