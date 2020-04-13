$(document).on( "turbolinks:load",function() { 
    $(".ratings_left_star .star ").each(function() {
        $(this).raty('set', { readOnly: true });
    });
    // $(".ratings_left_star .star ").css("background-color","red")

    //Tutor register city
    // Hide district and sub-district
    $(".location-district option").each( function(item){
        var element =  $(this) ; 
        element.hide();
    })
    $(".location-sub-district option").each( function(item){
        var element =  $(this) ; 
        element.hide();
    })
    // City changed
    $('.location-city').on('change', function() {
		var selected = $(this).val();
		$(".location-district option").each(function(item){
			console.log(selected) ;  
			var element =  $(this) ; 
			console.log(element.val()) ; 
			if (element.val() != selected){
				element.hide() ; 
			}else{
				element.show();
			}
		}) ; 
		$("#location-district").val($("#expertCat option:visible:first").val());      
    });

    //District changed
    $('.location-district').on('change', function() {
		var selected = $(this).val();
		$(".location-sub-district option").each(function(item){
			console.log(selected) ;  
			var element =  $(this) ; 
			console.log(element.val()) ; 
			if (element.val() != selected){
				element.hide() ; 
			}else{
				element.show();
			}
		}) ; 
		$("#location-sub-district").val($("#expertCat option:visible:first").val());      
    });
});