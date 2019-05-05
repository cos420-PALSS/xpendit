import 'package:flutter_test/flutter_test.dart';
import 'package:xpendit_app/extra_pass_strength.dart';

void main(){

  test('RC_01: ', () {
    var result = minRequirements(null);
    expect(result, false);
  });

  test('RC_02: ', () {
    var result = minRequirements('p@ssw0rd');
    expect(result, false);
  });

  test('RC_03: ', () {
    var result = minRequirements('g00dp@ssword');
    expect(result, true);
  });

  test('RC_04: ', () {
    var result = minRequirements('badPassword');
    expect(result, false);
  });

  test('RC_05: ', () {
    var result = minRequirements('badpassw0rd');
    expect(result, false);
  });

  test('RC_06: ', () {
    var result = minRequirements('b@dpassword');
    expect(result, false);
  });
}



