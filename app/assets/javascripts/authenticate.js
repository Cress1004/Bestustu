function phonenumber(inputtxt){
  var phoneno = /^\d{10}$/;
  if(inputtxt.match(phoneno)) {
      return true;
  }
  else {
      return false;
  }
}

function validateEmail(email) {
  var re = /\S+@\S+\.\S+/;
  return re.test(email);
}

function validate_location(){
  var city = $(".location-city").val();
  var district = $(".location-district").val();
  var sub_district = $(".location-sub-district").val();

  console.log(city);
  console.log(district);
  console.log(sub_district);

  var flag = true;

  if (city == 0) {
    $("#city_error").text("Cần chọn thành phố");
    flag = false;
  } else {
    $("#city_error").text("");
  }

  if (district == 0) {
    $("#district_error").text("Cần chọn quận huyện");
    flag = false;
  } else {
    $("#district_error").text("");
  }
  if (sub_district == 0) {
    $("#sub_district_error").text("Cần chọn phường xã");
    flag = false;
  } else {
    $("#sub_district_error").text("");
  }
  console.log("this is flag for location" + flag);
  return flag;
}
