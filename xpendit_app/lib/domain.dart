import 'rooms.dart';
import 'temp_databases.dart';


// our psuedo-account information we're using until we properly get multiple account working
class Person {
  String name;
  String emailAddress;
  String address;
  String phoneNumber;

  Person(String one, String two, String three, String four) {
    name = one;
    emailAddress = two;
    address = three;
    phoneNumber = four;
  }

  String getName() {
    return name;
  }
  String getEmailAddress() {
    return emailAddress;
  }
  String getAddress() {
    return address;
  }
  String getPhoneNumber(){
    return phoneNumber;
  }

  void setName(String newName) {
    name = newName;
  }
  void setEmailAddress(newEA) {
    emailAddress = newEA;
  }
  void setAddress(newAddress) {
    address = newAddress;
  }
  void setPhoneNumber(newPhoneNumber){
    phoneNumber = newPhoneNumber;
  }
}

//a user account
class Account {
  String username;
  String password;
  String emailAddress;
  //List to hold all of the debts associated with an account
  List<Charge> debts = [];
  List<Room> rooms = [];



  double sumCharges() {
    double sum = 0;
    //get the sum by iteration over the Charges in the debt list
    for(int x = 0; x< debts.length; x++){
      sum += debts[x].getAmount();
    }
    return sum;
  }
  // Whenever we cal/ this , we should make sure that the Charge is pulled from
  // the debts list, or the remove function may start doing weird stuff

  void payCharge(Charge chargeName, double paymentAmount) {
    chargeName.setAmount(chargeName.getAmount()-paymentAmount);
    //If the charge's amount is now zero and charge doesnt repeat,
    //remove charge from lists
    if(chargeName.getAmount() == 0 && !chargeName.recursive){
      debts.remove(chargeName);
      for(int x = 0; x < chargeName.getRecipients().length;x++){
        chargeName.getRecipients()[x].removeCharge(chargeName);
      }

    }
  }

  void displayCharge(Charge chargeName) {
    var title = chargeName.getTitle();
    var amount = chargeName.getAmount();
    var age = chargeName.getAge();
    var initiator = chargeName.getInitiator().getUsername();

    print('Charge Name: $title');
    print('Amount: $amount');
    print('Age: $age');
    print('Initiator: $initiator');
  }

  String getUsername() {
    return username;
  }
  String getEmailAddress() {
    return emailAddress;
  }
  String getPassword() {
    return password;
  }

  void setEmailAddress(newEA) {
    emailAddress = newEA;
  }
  void setPassword(newPassword) {
    password = newPassword;
  }

  void addCharge(Charge newCharge){
    debts.add(newCharge);
  }
  void removeCharge(Charge oldCharge){
    debts.remove(oldCharge);
  }

  //creates a new charge and goes through to add it to the debt list of everyone
  void makeCharge( String reason, List<Account> recipients, double amount, bool recursive,){
    Charge newCharge = new Charge(reason, amount, this, recipients, recursive);
    addCharge(newCharge);
    for(int x = 0; x < recipients.length; x++){
      recipients[x].addCharge(newCharge);
    }

  }

  Account(String user, String pass, String email) {
    username = user;
    password = pass;
    emailAddress = email;
  }

  //needs updating
  void createRoom(){
    List<Account> users;
    Room testRoom = new Room(users, 'TestName', null);
    rooms.add(testRoom);
    roomDatabase.add(testRoom);

  }

}




//Class for a single charge
class Charge {
  String title;
  double amount;
  DateTime dateOfCreation;
  Account initiator;
  List<Account> recipients;
  bool recursive;

  String getTitle() {
    return title;
  }
  double getAmount() {
    return amount;
  }
  DateTime getAge() {
    return dateOfCreation;
  }
  Account getInitiator() {
    return initiator;
  }
  List<Account> getRecipients() {
    return recipients;
  }
  bool isRecursive() {
    return recursive;
  }

  void setAmount(double dollas) {
    amount = dollas;
  }

  Charge(String name, double dollas, Account initUsername, List<Account> recipUsernames, bool recurse) {
    title = name;
    amount = dollas;
    initiator = initUsername;
    recipients = recipUsernames;
    recursive = recurse;
    dateOfCreation = DateTime.now();
  }
}