
$(document).on('turbolinks:load', function() {
    $('.slick').slick({
        infinite: true,
        slidesToShow: 5,
        slidesToScroll: 1,
        // autoplay:true,
        autoplaySpeed:2000,
        dots:true,
        centerMode: true,
        centerPadding: '0px',
        pauseOnDotsHover:true,
      });

      $('.save_item').on("click",function(){
        $(this).parent().children('.unsave_item').css("display","block");
        console.log($(this).parent().children('.unsave_item'));
        $(this).css( "display", "none" );

      });
      $('.unsave_item').on("click",function(){
        $(this).parent().children('.save_item').css("display","block");
        console.log($(this).parent().children('.save_item'));

        $(this).css( "display", "none" );

      });

})
