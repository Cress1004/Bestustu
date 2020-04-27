$(document).on("turbolinks:load", function() {
      $(".edus-nav-item").click(function() {
        $(".edus-content-item").eq($(this).index()).siblings().css( "display", "none" );
        $(".edus-content-item").eq($(this).index()).css( "display", "block" );
        $(this).addClass("user-navbar-active").siblings().removeClass("user-navbar-active");
      });
});

document.addEventListener("turbolinks:load", function(event){
  var currentLocation = window.location.href;
  var menuItem = document.querySelectorAll('nav .menu li a');
  var footerLeft = document.getElementById('footer-left');
  var footerRight = document.getElementById('footer-right');
  for(var i = 0;i < menuItem.length;i++){
    if(menuItem[i].href === currentLocation){
      menuItem[i].className += "navbar-active"
    }
  }
  console.log(window.location.href.indexOf("footer-right"));
  console.log(footerLeft);
  if(window.location.href.indexOf("footer-right") != -1){
    footerRight.className += "footer-active"
  }
  if(window.location.href.indexOf("footer-left") != -1){
    footerLeft.className += "footer-active"
  }
});
