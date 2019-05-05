import 'package:flutter/material.dart';
import 'auth.dart';
import 'extra_pass_strength.dart';


class LoginPage extends StatefulWidget {

  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() => new _LoginPageState();
  }

  //used for differentiating login and register page
  enum FormType{
    login,
    register
  }


  class _LoginPageState extends State<LoginPage>
  {

    String _email;
    String _password;
    //defaults to login page
    FormType _formType = FormType.login;

    final formKey = new GlobalKey<FormState>();


    //create email and password login form
    bool validateAndSave(){
        final form = formKey.currentState;
        form.save();
        if (form.validate()){
          return true;
        } else {
          return false;
        }
    }

    //submit login form to FirebaseAuth
    void validateAndSubmit() async{
      if (validateAndSave()){
        try{
          if (_formType == FormType.login){
            String userId = await widget.auth.signInWithEmailAndPassword(_email, _password);
            print('User Signed in: ${userId}');
          } else {
            String userId = await widget.auth.createUserWithEmailAndPassword(_email, _password);
            print('Registered User: ${userId}');
          }
          widget.onSignedIn();
        }
        catch (e){
          print('Error: $e');
        }
      }
    }

    //change to register form
    void moveToRegister(){
      formKey.currentState.reset();
      setState(() {
        _formType = FormType.register;
      });
    }

    //change to login form
    void moveToLogin(){
      formKey.currentState.reset();
      setState(() {
        _formType = FormType.login;
      });
    }


    @override
    Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
      body: new Container(

        //padding: EdgeInsets.all(40.0),
        padding: EdgeInsets.only(top: 100, left: 50, right: 50),
        child: new Form(
          key: formKey,
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: buildUserInputs() + buildSubmitButtons(),
            ),
        )
      )
    );
  }


  //email and password inputs
  List<Widget> buildUserInputs(){
    if(_formType == FormType.login ) {
      return [new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        //obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),];

    } else {
      return [new TextFormField(
        decoration: new InputDecoration(labelText: 'Email',),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
        style: new TextStyle(color: Colors.white),
        //initialValue: "EMAIL",
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        //obscureText: true,
        //validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        validator: (value) => minRequirements(value) ? null : 'Password requirements not met',
        onSaved: (value) => _password = value,
      ),];
    }
  }

  //login and register buttons
  List<Widget> buildSubmitButtons(){
      if(_formType == FormType.login ) {
        return [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),
          new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 40.0)),
          onPressed: validateAndSubmit,
          color: Colors.white,
          textColor: const Color(0xfffc7eb7),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
        new FlatButton(
          child: new Text(
              'Not a member? Sign up.', style: new TextStyle(fontSize: 20.0, color: Colors.lightBlueAccent)),
          onPressed: moveToRegister,
        )
        ];
      } else {
        return [
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
          ),new RaisedButton(
          child: new Text('Register', style: new TextStyle(fontSize: 40.0)),
          onPressed: validateAndSubmit,
          color: Colors.white,
          textColor: const Color(0xfffc7eb7),
          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0))
        ),
        new FlatButton(
          child: new Text(
              'Already have an account? Login.', style: new TextStyle(fontSize: 15.0, color: Colors.lightBlueAccent)),
          onPressed: moveToLogin,
        )
        ];
      }
  }



}