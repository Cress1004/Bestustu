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
