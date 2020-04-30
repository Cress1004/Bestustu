$(document).on("turbolinks:load", function () {
  $("#new_user_form").submit(function (e) {
    var phone = $.trim($("#user_phone").val());
    var username = $("#user_username").val();
    var email = $.trim($("#user_email").val());
    var flag = true;

    //Username
    if (
      username == "" ||
      username.length < 4 ||
      username.length > 14 ||
      /\s/.test(username)
    ) {
      $("#username_error").text(
        "Invalid username  (4 - 14 charactes, No space)"
      );
      e.preventDefault();
      flag = false;
    } else {
      for (var i = 0; i < gon.global.users.length; i++) {
        if (username == gon.global.users[i].username) {
          $("#username_error").text("User name already exsisted");
          e.preventDefault();
          flag = false;
          break;
        }
        $("#username_error").text("");
      }
    }
    //Phone
    if (!phonenumber(phone)) {
      $("#phone_error").text("Phone number must be 10 number characters");
      e.preventDefault();
      flag = false;
    } else {
      $("#phone_error").text("");
    }
    // email
    if (!validateEmail(email)) {
      $("#email_error").text("Email is invalid!");
      e.preventDefault();
      flag = false;
    } else {
      $("#email_error").text("");
    }
    return flag;
  });

  $("#edit_user").submit(function (e) {
    var name = $.trim($("#user_name").val());
    var phone = $.trim($("#user_phone").val());
    var username = $("#user_username").val();
    var flag = true;
    // Name
    if (name == "" || name.length < 4) {
      $("#name_error").text("Input full name, please");
      e.preventDefault();
      flag = false;
    } else {
      $("#name_error").text("");
    }
    // User name
    if (
      username == "" ||
      username.length < 4 ||
      username.length > 14 ||
      /\s/.test(username)
    ) {
      $("#username_error").text(
        "Invalid username  (4 - 14 charactes, No space)"
      );
      e.preventDefault();
      flag = false;
    } else {
      for (var i = 0; i < gon.global.users.length; i++) {
        console.log(gon.global.current_user);
        if (username == gon.global.users[i].username) {
          if (username == gon.global.current_user.username) {
            break;
          }
          $("#username_error").text("User name already exsisted");
          e.preventDefault();
          flag = false;
          break;
        }
        $("#username_error").text("");
      }
    }
    //Phone
    if (!phonenumber(phone)) {
      $("#phone_error").text("Phone number must be 10 number characters");
      e.preventDefault();
      flag = false;
    } else {
      $("#phone_error").text("");
    }
    // Gender
    if (
      !$("#user_gender_0").is(":checked") &&
      !$("#user_gender_1").is(":checked")
    ) {
      $("#gender_error").text("Please select gender");
      e.preventDefault();
      flag = false;
    } else {
      $("#gender_error").text("");
    }
    // Birthday
    if (!$("#user_birthday").val()){
      $("#birthday_error").text("Please select birthday");
      e.preventDefault();
      flag = false;
    } else {
      $("#birthday_error").text("");
    }
    return flag;
  });

  $("#new_student").submit(function (e) {
    var address = $.trim($("#student_address").val());
    // var phone = $.trim($("#user_phone").val());
    var flag = true;

    if (name == "" || name.length < 10) {
      $("#address_error").text("At least 10 characters");
      e.preventDefault();
      flag = false;
    } else {
      $("#address_error").text("");
    }

    return flag;
  });

  $("#edit_tutor_2").submit(function (e) {
    var city = $(".location-city").val();
    var district = $(".location-district").val();
    var sub_district = $(".location-sub-district").val();

    var flag = true;

    if (city == 0) {
      $("#city_error").text("Invalid");
      e.preventDefault();
      flag = false;
    } else {
      $("#city_error").text("");
    }

    if (district == 0) {
      $("#district_error").text("Invalid");
      e.preventDefault();
      flag = false;
    } else {
      $("#district_error").text("");
    }
    if (sub_district == 0) {
      $("#sub_district_error").text("Invalid");
      e.preventDefault();
      flag = false;
    } else {
      $("#sub_district_error").text("");
    }

    return flag;
  });

  $("#new_tutor").submit(function (e) {
    var city = $(".location-city").val();
    var district = $(".location-district").val();
    var sub_district = $(".location-sub-district").val();

    var flag = true;

    if (city == 0) {
      $("#city_error").text("Invalid");
      e.preventDefault();
      flag = false;
    } else {
      $("#city_error").text("");
    }

    if (district == 0) {
      $("#district_error").text("Invalid");
      e.preventDefault();
      flag = false;
    } else {
      $("#district_error").text("");
    }
    if (sub_district == 0) {
      $("#sub_district_error").text("Invalid");
      e.preventDefault();
      flag = false;
    } else {
      $("#sub_district_error").text("");
    }

    return flag;
  });
});
