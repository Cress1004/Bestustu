function phonenumber(inputtxt)
{
  var phoneno = /^\d{10}$/;
  if(inputtxt.match(phoneno))
        {
      return true;
        }
      else
        {
        return false;
        }
}

function checkPhoneNumber(input_phone){
  var phone_number = /^\d{10}$/;
  if(phone_number.match(input_phone)){
    return true;
  } else {
    return false;
  }
}

$(document).ready(function(){
   $('#edit_user').submit(function(){
      var name = $.trim($('#user_name').val());
      var phone = $.trim($('#user_phone_number').val());
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
       //user name
       if (username == '' || username.length < 4){
           $('#username_error').text('Username must be from 4 characters , please');
           flag = false;
       }
       else{
           $('#username_error').text('');
       }
        //Phone
       if(!phonenumber(phone)){
           $('#phone_number_error').text('Phone number must be 10 number characters');
           flag = false;
       }
       else{
           $('#phone_number_error').text('');
       }

       return flag;
   });
});
