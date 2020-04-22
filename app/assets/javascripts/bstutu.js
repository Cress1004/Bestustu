$(document).on( "turbolinks:load",function() {
    $(".ratings_left_star .star ").each(function() {
        $(this).raty('set', { readOnly: true });
    });
    // $(".ratings_left_star .star ").css("background-color","red")

	$(".location-district").append(`<option >Quận Huyện</option>`)
	$(".location-sub-district").append(`<option >Phường xã</option>`)
	//City changed
    $('.location-city').on('change', function() {
		var selected = $(this).val();
		$(".location-district").children().remove();
		$(".location-district").append(`<option >Quận Huyện</option>`)
		for (var i = 0; i < gon.global.locations_district.length; i++) {
			// console.log(gon.global.locations_district[i].city_id);
			// console.log(selected)
			if(gon.global.locations_district[i].city_id == selected) {
				$(".location-district").append(`<option value="${gon.global.locations_district[i].district_id}">${gon.global.locations_district[i].district}</option>`)
			}
		}
    });

    //District changed
    $('.location-district').on('change', function() {
		var selected = $(this).val();
		$(".location-sub-district").children().remove();
		$(".location-sub-district").append(`<option >Phường xã</option>`)
		console.log(gon.global.locations_sub_district.length);
		for (var i = 0; i < gon.global.locations_sub_district.length; i++) {
			if(gon.global.locations_sub_district[i].district_id == selected) {
				console.log(gon.global.locations_sub_district[i]);
				$(".location-sub-district").append(`<option value="${gon.global.locations_sub_district[i].id}">${gon.global.locations_sub_district[i].sub_district}</option>`)
			}
		}
	});

	//Avatar link changed
	$('#student_image').on('change', function(event){
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$("#regis-ava").fadeIn("fast").attr('src',tmppath);
	})
	$('#tutor_image').on('change', function(event){
		var tmppath = URL.createObjectURL(event.target.files[0]);
		$("#regis-ava").fadeIn("fast").attr('src',tmppath);
	})

});
