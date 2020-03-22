// function phonenumber(inputtxt)
// {
//   console.log("hihi");
//   var phoneno = /^\d{10}$/;
//   if(inputtxt.value.match(phoneno))
//         {
//       return true;
//         }
//       else
//         {
//         alert("message");
//         return false;
//         }
// }

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
           $('#username_error').text(' username , please');
           flag = false;
       }
       else{
           $('#username_error').text('');
       }
        //Phone
       // if(phone == '' || phone.length < 4){
       //     $('#phone_error').text('Phone number must be 10 number characters');
       //     flag = false;
       // }
       // else{
       //     $('#phone_error').text('');
       // }

       return flag;
   });
});
