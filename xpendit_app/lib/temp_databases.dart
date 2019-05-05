import 'domain.dart';
import 'rooms.dart';


class localTestingInformation{
  //temporary local files until attached to a firebase or and database
  Person testLocalPerson0 = new Person("Harold Smith", 'HSmith@gmail.com', '123 Real Lane', '5415986342');
  Account testLocalUser0 = new Account('Harold12', 'securePassw0rd', 'HSmith@gmail.com');

  Person testLocalPerson1 = new Person("Jenny Martha", 'JennyM@gmail.com', '321 Legit Street', '1234567891');
  Account testLocalUser1 = new Account('JennyGurl', 'g0odP@ssword', 'JennyM@gmail.com');

  List<Account> testList = new List<Account>();

  String getName(){
    return testLocalPerson0.getName();
  }

//testLocalRoom.makeCharge('Testing', testLocalUser0, testLocalRoom.getUserList(), 500, false);
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
  return null;
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
  return null;
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
  return null;
}
