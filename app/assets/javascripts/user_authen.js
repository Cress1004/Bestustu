function phonenumber(inputtxt){
  var phoneno = /^\d{10}$/;
  if(inputtxt.match(phoneno)) {
      return true;
  }
  else {
      return false;
  }
}

function checkEmail(email) {
    var filter = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    if (!filter.test(email.value)) {
        return false;
    }
    else{
        return true;
    }
}

function validateEmail(email) {
  var re = /\S+@\S+\.\S+/;
  return re.test(email);
}


$(document).ready('turbolinks:load', function(){
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

  $('#new_user').submit(function(){
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
});
