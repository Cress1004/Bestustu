document.addEventListener("turbolinks:load", function(event) { 
      $(".edus-nav-item").click(function() {
        $(".edus-content-item").eq($(this).index()).siblings().css( "display", "none" );
        $(".edus-content-item").eq($(this).index()).css( "display", "block" );
      });
});


    
 