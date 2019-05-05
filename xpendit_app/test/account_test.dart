import 'package:flutter_test/flutter_test.dart';
import 'package:xpendit_app/temp_databases.dart';
import 'package:xpendit_app/domain.dart';

void main(){

  test('AC_00: ', () {
    Account testAcc = new Account('username', 'password', 'email@email.com');
    testAcc.createRoom();
    var result = roomDatabase.isNotEmpty;
    expect(result, true);
    roomDatabase.clear();
  });

  test('AC_01: ', () {
    Account testAcc = new Account('username', 'password', 'email@email.com');
    Account testAcc2 = new Account('username', 'password', 'email@email.com');
    List<Account> tempList = new List<Account>();
    tempList.add(testAcc);
    tempList.add(testAcc2);
    Charge testCharge = new Charge('test', 45, testAcc, tempList, false);
    testAcc.addCharge(testCharge);
    var result = testAcc.debts.isNotEmpty;
    expect(result, true);
  });


  test('AC_02: ', () {
    Account testAcc = new Account('username', 'password', 'email@email.com');
    var result = testAcc.sumCharges();
    expect(result, 0);
  });

  test('AC_03: ', () {
    Account testAcc = new Account('username', 'password', 'email@email.com');
    Account testAcc2 = new Account('username', 'password', 'email@email.com');
    List<Account> tempList = new List<Account>();
    tempList.add(testAcc);
    tempList.add(testAcc2);
    Charge testCharge1 = new Charge('test', 35, testAcc, tempList, false);
    Charge testCharge2 = new Charge('test2', 10, testAcc, tempList, false);
    Charge testCharge3 = new Charge('test2', 155, testAcc, tempList, false);
    testAcc.addCharge(testCharge1);
    testAcc.addCharge(testCharge2);
    testAcc.addCharge(testCharge3);
    double totalCharges = testAcc.sumCharges();
    var result = testAcc.sumCharges();
    expect(result, 200);
  });

  test('AC_04: ', () {
    Account testAcc = new Account('username', 'password', 'email@email.com');
    Account testAcc2 = new Account('username', 'password', 'email@email.com');
    List<Account> tempList = new List<Account>();
    tempList.add(testAcc);
    tempList.add(testAcc2);
    const double infinity = 1.0/0.0;
    Charge testCharge1 = new Charge('test', infinity, testAcc, tempList, false);
    Charge testCharge2 = new Charge('test2', 10, testAcc, tempList, false);
    Charge testCharge3 = new Charge('test2', 155, testAcc, tempList, false);
    testAcc.addCharge(testCharge1);
    testAcc.addCharge(testCharge2);
    testAcc.addCharge(testCharge3);
    double totalCharges = testAcc.sumCharges();
    var result = testAcc.sumCharges();
    expect(result, infinity);
  });



}