bool minRequirements(String password){

  int sum =0;

  if(password == null)
    return false;
  if (password.isEmpty)
    return false;
  else if (password.length < 11)
    return false;
  else {
    if (password.contains(new RegExp(r'[^a-zA-Z0-9]'))) {
      sum += 1;
      //print('symbol');
    }

    if (password.contains(new RegExp(r'[a-z]'))) {
      sum += 1;
      //print('lower');
    }

    if (password.contains(new RegExp(r'[A-Z]'))) {
      //print('upper');
      sum += 1;
    }

    if (password.contains(new RegExp(r'[0-9]'))) {
      sum += 1;
      //print('number');
    }

    //print('password strength $sum');
    if (sum < 3)
      return false;
    else
      return true;
  }
}