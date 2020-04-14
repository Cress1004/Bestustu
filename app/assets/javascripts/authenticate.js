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

$(document).ready(function(){
    $('#edit_user').submit(function(){
       var name = $.trim($('#user_name').val());
       var phone = $.trim($('#user_phone').val());
       var username = $.trim($('#user_username').val());
       var flag = true;
        // Name
        if (name == '' || name.length < 4){
            $('#name_error').text('Input full name, please');
            flag = false;
        }
        else{
            $('#name_error').text('');
        }
        if (username == '' || username.length < 4){
            $('#username_error').text('Input username , please');
            flag = false;
        }
        else{
            $('#username_error').text('');
        }
         //Phone
        if(!phonenumber(phone)){
            $('#phone_error').text('Phone number must be 10 number characters');
            flag = false;
        }
        else{
            $('#phone_error').text('');
        }
        return flag;
    });
    $('#new_user_form').submit(function(){
       var phone = $.trim($('#user_phone').val());
       var username = $.trim($('#user_username').val());
       var email = $.trim($('#user_email').val());
       var flag = true;

        if (username == '' || username.length < 4){
            $('#username_error').text('Input username , please');
            flag = false;
        }
        else{
            $('#username_error').text('');
        }
         //Phone
        if(!phonenumber(phone)){
            $('#phone_error').text('Phone number must be 10 number characters');
            flag = false;
        }
        else{
            $('#phone_error').text('');
        }
        // email
        if (!validateEmail(email)) {
          $('#email_error').text('Email is not valid!');
          flag = false;
        }
        else{
          $('#email_error').text('');
        }
        return flag;
    });
  $('#new_class_register').submit(function(){
     var flag = true;
     var description  = $.trim($('#class_register_description').val());
     var class_content  = $.trim($('#class_register_class_content').val());
     var address = $.trim($('#class_register_address').val());
     // var subject = $.trim($('#class_register_subject_id').val());
     // var location = $.trim($('#class_register_location').val());
     // var salary = $.trim($('#class_register_salary').val());
     // var num_student = $.trim($('#class_register_address').val());
     // description
     if (description.length < 10 || description.length > 400){
         $('#description_error').text('Length of description is between 10 and 400 charaters');
         flag = false;
     }
     else
       $('#description_error').text('');
     if (class_content.length < 10 || class_content.length > 400){
         $('#class_content_error').text('Length of class_content is between 10 and 400 charaters');
         flag = false;
     }
     else
       $('#class_content_error').text('');
     if (address.length < 10 || address.length > 400){
         $('#address_error').text('Length of address is between 10 and 100 charaters');
         flag = false;
     }
     else
       $('#address_error').text('');
    return flag;
  });
  $('#edit_class_register').submit(function(){
     var flag = true;
     var description  = $.trim($('#class_register_description').val());
     var class_content  = $.trim($('#class_register_class_content').val());
     var address = $.trim($('#class_register_address').val());
     // description
     if (description.length < 10 || description.length > 400){
         $('#description_error').text('Length of description is between 10 and 400 charaters');
         flag = false;
     }
     else
       $('#description_error').text('');
     if (class_content.length < 10 || class_content.length > 400){
         $('#class_content_error').text('Length of class_content is between 10 and 400 charaters');
         flag = false;
     }
     else
       $('#class_content_error').text('');
     if (address.length < 10 || address.length > 400){
         $('#address_error').text('Length of address is between 10 and 100 charaters');
         flag = false;
     }
     else
       $('#address_error').text('');
    return flag;
  });
  $('#new_tutor').submit(function(){
    var flag = true;
    var job = $.trim($('#tutor_job').val());
    var work_place = $.trim($('#tutor_work_place').val());
    var name = $.trim($('#user_name').val());
    if (job == ''){
        $('job_error').text('Job can\'t be blank');
        flag = false;
    }
    else
      $('#job_error').text('');
    if (work_place == ''){
        $('work_place_error').text('work place can\'t be blank');
        flag = false;
    }
    else
      $('#work_place_error').text('');

    if (name == '' || name.length < 4){
        $('#name_error').text('Input full name, please');
        flag = false;
    }
    else{
        $('#name_error').text('');
    }
    return flag;
  });
  $('#edit_tutor').submit(function(){
    var flag = true;
    var job = $.trim($('#tutor_job').val());
    var work_place = $.trim($('#tutor_work_place').val());
    if (job == ''){
        $('job_error').text('Job can\'t be blank');
        flag = false;
    }
    else
      $('#job_error').text('');
    if (work_place == ''){
        $('work_place_error').text('work place can\'t be blank');
        flag = false;
    }
    return flag;
  });

});
