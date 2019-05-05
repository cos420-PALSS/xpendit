import 'domain.dart';
import 'temp_databases.dart';


class Room{
  String name;
  List<Account> userList = [];
  List<Charge> roomCharges = [];

  List<Account> getUserList(){
    return userList;
  }

  List<Charge> getCharges(){
    return roomCharges;
  }

  void addCharge(Charge charge){
    roomCharges.add(charge);
  }

  void removeCharge(Charge charge){
    roomCharges.remove(charge);
  }

  void addUser(Account user){
    userList.add(user);
  }

  void addUser_Name(String username){
    Account temp = findUser(username);
    if (temp == null)
      return;
    else{
      userList.add(temp);
    }
  }

  void addUserEmail(String email){
    Account temp = findUserEmail(email);
    if (temp == null){
      return;
    }
    else {
      userList.add(temp);
    }

  }

  void removeUser(Account user){
    userList.remove(user);
  }

  //creates a new charge and goes through to add it to the debt list of everyone
  void makeCharge( String reason, Account initiator, List<Account> recipients, double amount, bool recursive){
    if ((recipients) == null || (initiator == null)){
      return;
    }
    Charge newCharge = new Charge(reason, amount, initiator, recipients, recursive); //a sixth argument was here "this" and it borked stuff
    addCharge(newCharge);
    for(int x = 0; x < recipients.length; x++){
      recipients[x].addCharge(newCharge);
    }
  }

  Room(List<Account> users, String newName, List<Charge> charges){
    name = newName;
    userList= users;
    roomCharges = charges;
  }
}