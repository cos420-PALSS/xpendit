import 'domain.dart';
import 'rooms.dart';



void main(){

}

//temporary account "database"
List<Account> accountDatabase = new List<Account>();

//temporary room "database"
List<Room> roomDatabase = new List<Room>();

//temporary save user until Firebase connection is implemented
void saveUser(var user){

  if(user == null){
    return;
  }
  try{
    accountDatabase.add(user);
  } catch (e){
    print(e);
  }
}


Account getUser(String email, String password){
  for (var i = 0; i<accountDatabase.length; i++){
    if ((accountDatabase[i].getEmailAddress() == email) && (accountDatabase[i].getPassword() == password)){
      return accountDatabase[i];
    }
    else {
      print('Account does not exist with given username and password');
      return null;
    }
  }
}

Account findUser(String username){
  for (var i=0;i<accountDatabase.length;i++){
    if(accountDatabase[i].getUsername() == username){
      return accountDatabase[i];
    } else{
      print('Account with given username does not exist');
      return null;
    }
  }
}

Account findUserEmail(String email){
  for (var i=0;i<accountDatabase.length;i++){
    if(accountDatabase[i].getEmailAddress() == email){
      return accountDatabase[i];
    } else{
      print('Account with given email does not exist');
      return null;
    }
  }
}



