import 'package:flutter_test/flutter_test.dart';
import 'package:xpendit_app/temp_databases.dart';
import 'package:xpendit_app/domain.dart';
import 'package:xpendit_app/rooms.dart';

void main(){

  test('RO_00: ', () {
    Room testRoom = new Room([], "TestRoom", null);
    Account testAcc = new Account('TestUsername', 'password', 'email@email.com');
    accountDatabase.add(testAcc);
    testRoom.addUser_Name('TestUsername');
    var result = testRoom.getUserList().isNotEmpty;
    expect(result, true);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_01: ', () {
    Room testRoom = new Room([], "TestRoom", null);
    Account testAcc = new Account('TestUsername', 'password', 'email@email.com');
    accountDatabase.add(testAcc);
    testRoom.addUser_Name(null);
    var result = testRoom.getUserList().isNotEmpty;
    expect(result, false);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_02: ', () {
    Room testRoom = new Room([], "TestRoom", null);
    Account testAcc = new Account('TestUsername', 'password', 'email@email.com');
    accountDatabase.add(testAcc);
    testRoom.addUser_Name('InvalidName');
    var result = testRoom.getUserList().isNotEmpty;
    expect(result, false);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_03: ', () {
    Room testRoom = new Room([], "TestRoom", null);
    Account testAcc = new Account('TestUsername', 'password', 'fakeemail@mail.com');
    accountDatabase.add(testAcc);
    testRoom.addUserEmail('fakeemail@mail.com');
    var result = testRoom.getUserList().isNotEmpty;
    expect(result, true);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_04: ', () {
    Room testRoom = new Room([], "TestRoom", null);
    Account testAcc = new Account('TestUsername', 'password', 'fakeemail@mail.com');
    accountDatabase.add(testAcc);
    testRoom.addUserEmail('wrongemail@mail.com');
    var result = testRoom.getUserList().isNotEmpty;
    expect(result, false);
    testRoom.userList.clear();
    accountDatabase.clear();
  });

  test('RO_05: ', () {
    Room testRoom = new Room([], "TestRoom", null);
    Account testAcc = new Account('TestUsername', 'password', 'fakeemail@mail.com');
    accountDatabase.add(testAcc);
    testRoom.addUserEmail(null);
    var result = testRoom.getUserList().isNotEmpty;
    expect(result, false);
    testRoom.userList.clear();
    accountDatabase.clear();
  });
}

