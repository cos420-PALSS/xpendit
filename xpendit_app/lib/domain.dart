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

class Account {
  String username;
  String password;
  String emailAddress;

  double sumCharges() {
    double sum = 0;
    Charge chargeName;
    while(chargeName.getAmount() != null) {
      if((chargeName.getRecipients()).contains(username)) {
        sum += chargeName.getAmount();
      }
      // somehow need to traverse all charge objects here
    }
    return sum;
  }

  void payCharge(Charge chargeName, double paymentAmount) {
    chargeName.setAmount(chargeName.getAmount()-paymentAmount);
  }

  void displayCharge(Charge chargeName) {
    var title = chargeName.getTitle();
    var amount = chargeName.getAmount();
    var age = chargeName.getAge();
    var initiator = chargeName.getInitiator();

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
  void setAddress(newPassword) {
    password = newPassword;
  }

  Account(String user, String pass, String email) {
    username = user;
    password = pass;
    emailAddress = email;
  }

}

class Charge {
  String title;
  double amount;
  DateTime dateOfCreation;
  String initiator;
  String recipients;
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
  String getInitiator() {
    return initiator;
  }
  String getRecipients() {
    return recipients;
  }
  bool isRecursive() {
    return recursive;
  }

  void setAmount(double dollas) {
    amount = dollas;
  }

  Charge(String name, double dollas, String initUsername, String recipUsernames, bool recurse) {
    title = name;
    amount = dollas;
    initiator = initUsername;
    recipients = recipUsernames;
    recursive = recurse;
    dateOfCreation = DateTime.now();
  }
}