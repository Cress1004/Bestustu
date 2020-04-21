$(document).on( "turbolinks:load",function() { 
    $(".ratings_left_star .star ").each(function() {
        $(this).raty('set', { readOnly: true });
    });
    // $(".ratings_left_star .star ").css("background-color","red")
});