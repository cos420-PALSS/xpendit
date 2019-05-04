import 'package:flutter/material.dart';
import 'auth.dart';


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
      appBar: new AppBar(title: new Text('Login'),
      ),
      body: new Container(
        padding: EdgeInsets.all(16.0),
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
      return [new TextFormField(
        decoration: new InputDecoration(labelText: 'Email'),
        validator: (value) => value.isEmpty ? 'Email can\'t be empty' : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: new InputDecoration(labelText: 'Password'),
        obscureText: true,
        validator: (value) => value.isEmpty ? 'Password can\'t be empty' : null,
        onSaved: (value) => _password = value,
      ),];
  }

  //login and register buttons
  List<Widget> buildSubmitButtons(){
      if(_formType == FormType.login ) {
        return [new RaisedButton(
          child: new Text('Login', style: new TextStyle(fontSize: 40.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text(
              'Not a member? Sign up.', style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        )
        ];
      } else {
        return [new RaisedButton(
          child: new Text('Register', style: new TextStyle(fontSize: 40.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: new Text(
              'Already have an account? Login.', style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )
        ];
      }
  }



}