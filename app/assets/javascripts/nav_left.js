$(document).on("turbolinks:load", function() { 
      $(".edus-nav-item").click(function() {
        $(".edus-content-item").eq($(this).index()).siblings().css( "display", "none" );
        $(".edus-content-item").eq($(this).index()).css( "display", "block" );
        $(this).addClass("user-navbar-active").siblings().removeClass("user-navbar-active");
      });
});

document.addEventListener("turbolinks:load", function(event){
  var currentLocation = window.location.href;
  var menuItem = document.querySelectorAll('nav ul li a');
  for(var i = 0;i < menuItem.length;i++){
    if(menuItem[i].href === currentLocation){
      menuItem[i].className += "navbar-active"
    }
  }
});


    
