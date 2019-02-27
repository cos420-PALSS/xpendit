import 'package:flutter/material.dart';

void main() => runApp(XpenditApp());

class XpenditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      title: "Home",
      home: new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        body: new Title(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text('Messages'),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                title: Text('Profile')
            )
          ],
        ),
      ),
    );

  }
}

class Title extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 40, right: 40),
      alignment: Alignment.topRight,
      child: new Text("Xpendit", style: new TextStyle(fontSize:45.0, color: const Color(0xfffc7eb7)),),
    );
  }

}