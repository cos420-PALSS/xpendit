import 'package:flutter_test/flutter_test.dart';
import 'package:xpendit_app/temp_databases.dart';
import 'package:xpendit_app/domain.dart';


void main(){

  test('UD_00: ', () {
    Account testAcc = new Account('TestUser', 'g0odP@ssword', 'fakeemail@mail.com');
    saveUser(testAcc);
    var result = accountDatabase.isNotEmpty;
    expect(result, true);
    accountDatabase.clear();
  });

  test('UD_01: ', () {
    Account testAcc = null;
    saveUser(testAcc);
    var result = accountDatabase.isNotEmpty;
    expect(result, false);
    accountDatabase.clear();
  });

  test('UD_02: ', () {
    int testInt= 45;
    saveUser(testInt);
    var result = accountDatabase.isNotEmpty;
    expect(result, false);
    accountDatabase.clear();
  });

  test('UD_03: ', () {
    Account testAcc = new Account('TestUser', 'g0odP@ssword', 'fakeemail@mail.com');
    saveUser(testAcc);
    var result = getUser('fakeemail@mail.com', 'g0odP@ssword');
    expect(result, testAcc);
    accountDatabase.clear();
  });

  test('UD_04: ', () {
    Account testAcc = new Account('TestUser', 'g0odP@ssword', 'fakeemail@mail.com');
    saveUser(testAcc);
    var result = getUser('fakeemail@mail.com', 'wrongpassword');
    expect(result, null);
    accountDatabase.clear();
  });

  test('UD_04: ', () {
    Account testAcc = new Account('TestUser', 'g0odP@ssword', 'fakeemail@mail.com');
    saveUser(testAcc);
    var result = getUser('wrongemail@mail.com', 'g0odP@ssword');
    expect(result, null);
    accountDatabase.clear();
  });

  test('UD_05: ', () {
    var result = getUser('testemail@mail.com', 'g0odP@ssword');
    expect(result, null);
    accountDatabase.clear();
  });






}
