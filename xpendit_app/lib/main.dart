import 'package:flutter/material.dart';

void main() => runApp(XpenditApp());

class XpenditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Home",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("Home"),
        ),
        body: new HomeWidget(),
      ),
    );
  }
}

class HomeWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Text("Xpendit", style: new TextStyle(fontSize:24.0),),
    );
  }

}