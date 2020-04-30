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

  $('#new_tutor').submit(function(){
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
