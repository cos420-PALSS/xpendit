import 'package:flutter/material.dart';
import 'auth.dart';

//Old homepage from testing creation. Logout stopped working here too
class HomePage extends StatelessWidget {



  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome'),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Logout', style: new TextStyle(fontSize: 17.0, color: Colors.white)),
            //onPressed: _signOut
          )
        ],
      ),
      body: new Container(
        child: new Center(
          child: new Text('Welcome', style: new TextStyle(fontSize: 32.0))
        ),
      )
    );
  }
}