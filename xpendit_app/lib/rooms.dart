import 'domain.dart';

class Room{
  String name;
  List<Account> userList;
  List<Charge> roomCharges;

  void addCharge(Charge charge){
    roomCharges.add(charge);
  }

  void removeCharge(Charge charge){
    roomCharges.remove(charge);
  }

  void addUser(Account user){
    userList.add(user);
  }

  void removeUser(Account user){
    userList.remove(user);
  }

  //creates a new charge and goes through to add it to the debt list of everyone
  void makeCharge( String reason, Account initiator, List<Account> recipients, double amount, bool recursive){
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