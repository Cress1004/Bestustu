
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
        // nextArrow: '<i class="fa fa-arrow-right"></i>',
        // prevArrow: '<i class="fa fa-arrow-left"></i>',
        // dots:'<i class="fa fa-arrow-left"></i>',
        pauseOnDotsHover:true,
      });
      
      
})



