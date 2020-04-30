$(document).on( "turbolinks:load",function() {
    $(".ratings_left_star .star ").each(function() {
        $(this).raty('set', { readOnly: true });
	});
	$("body").on("click","img",function(){
		location.reload(true);
	})
    // $(".ratings_left_star .star ").css("background-color","red")

	$(".location-district").append(`<option value="0">Quận Huyện</option>`)
	$(".location-sub-district").append(`<option value="0">Phường xã</option>`)
	//City changed
    $('.location-city').on('change', function() {
		var selected = $(this).val();
		//reset district
		$(".location-district").children().remove();
		$(".location-district").append(`<option value="0">Quận Huyện</option>`)
		//reset sub-district
		$(".location-sub-district").children().remove();
		$(".location-sub-district").append(`<option value="0">Phường xã</option>`)

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
		$(".location-sub-district").append(`<option value="0">Phường xã</option>`)
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
