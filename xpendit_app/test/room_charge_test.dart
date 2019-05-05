import 'package:flutter_test/flutter_test.dart';
import 'package:xpendit_app/temp_databases.dart';
import 'package:xpendit_app/domain.dart';
import 'package:xpendit_app/rooms.dart';

void main(){

  test('RO_06: ', () {
    Room testRoom = new Room([], "TestRoom", []);
    Account testAcc1 = new Account('TestUsername1', 'password1', 'email1@email.com');
    Account testAcc2 = new Account('TestUsernameOther', 'password2', 'email2@email.com');
    saveUser(testAcc1);
    saveUser(testAcc2);
    List<Account> tempList = testRoom.getUserList();
    print(tempList);
    testRoom.makeCharge("Testing", testAcc1, tempList, 45, false);

    var result = ((testAcc1.debts.isNotEmpty) && testAcc2.debts.isNotEmpty);
    expect(result, true);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_07: ', () {
    Room testRoom = new Room([], "TestRoom", []);
    Account testAcc1 = new Account('TestUsername1', 'password1', 'email1@email.com');
    accountDatabase.add(testAcc1);
    testRoom.addUser_Name('TestUsername1');
    List<Account> tempList = [testAcc1];
    testRoom.makeCharge("Testing", testAcc1, tempList, 45, false);
    var result = testAcc1.debts.isNotEmpty;
    expect(result, true);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_08: ', () {
    Room testRoom = new Room([], "TestRoom", []);
    testRoom.makeCharge("Testing", null, null, 45, false);

    var result = testRoom.getCharges().isEmpty;
    expect(result, true);
    testRoom.userList.clear();
    accountDatabase.clear();
  });




}

