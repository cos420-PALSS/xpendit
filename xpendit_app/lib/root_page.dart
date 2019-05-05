import 'package:flutter/material.dart';
import 'login_page.dart';
import 'auth.dart';
import 'home_page.dart';
import 'main.dart';


//Intermediate page between homepage and login/register page
class RootPage extends StatefulWidget {

  final BaseAuth auth;
  RootPage({this.auth});

  @override
  State<StatefulWidget> createState() => new _RootPAgeState();


}

//status of authorizatation
enum AuthStatus{
  notSignedin,
  signedIn
}

class _RootPAgeState extends State<RootPage>{

  //initially not signed in
  AuthStatus _authStatus = AuthStatus.notSignedin;

  //checks if a user logged in & saves user on closing of the application
  @override
  void initState() {
    super.initState();
    widget.auth.currentUser().then((userId) {
      setState(() {
        //_authStatus = userId == null ? AuthStatus.notSignedin : AuthStatus.signedIn;
      });
    });
  }

  void _signedIn(){
    setState(() {
      _authStatus = AuthStatus.signedIn;
    });
  }

  void _signedOut(){
    setState(() {
      _authStatus = AuthStatus.notSignedin;
    });
  }



  @override
  Widget build(BuildContext context) {
    switch(_authStatus){
      case AuthStatus.notSignedin:
        return new LoginPage(
            auth: widget.auth,
        onSignedIn: _signedIn);
      case AuthStatus.signedIn:
        return new Page();
    }
  }
}