
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
        // variableWidth: true
        responsive: [
          {
            breakpoint: 1024,
            settings: {
              slidesToShow: 3,
              slidesToScroll: 3,
              infinite: true,
              dots: true
            }
          },
          {
            breakpoint: 600,
            settings: {
              slidesToShow: 2,
              slidesToScroll: 2
            }
          },
          {
            breakpoint: 480,
            settings: {
              slidesToShow: 1,
              slidesToScroll: 1
            }
          }
          // You can unslick at a given breakpoint now by adding:
          // settings: "unslick"
          // instead of a settings object
        ]
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

      var avaWidth = $(".slick-item-ava").width();
      $(".slick-item-ava img").height(avaWidth);
      $(".slick-item").height(avaWidth*2.1);
      $(".card").height(avaWidth*2.2);


      $(".edus-background").height($(".edus-background").width() * 2/5.5);
      $(".slick-track").css("padding","2rem 0rem");
      
})
