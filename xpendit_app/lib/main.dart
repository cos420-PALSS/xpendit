import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(XpenditApp());

class XpenditApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      //Keeps device locked in portrait mode
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return new MaterialApp(
      theme: ThemeData(fontFamily: 'Open Sans'),
      title: "Xpendit",
      debugShowCheckedModeBanner: false,
      home: Home()
    );

  }
}

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        body: new Title(),
        bottomNavigationBar: NavBar()
    );
  }
}

class Groups extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return new Scaffold(
        backgroundColor: const Color(0xff9b42f4),
        body: new Title(),
        bottomNavigationBar: NavBar()
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


//navigation bar class
class NavBar extends StatefulWidget{
  @override
  _NavBar createState() => _NavBar();
}
class _NavBar extends State<NavBar>{
  int pageIndex = 0; //default page

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
        // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xff3b3a43),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: const Color(0xff00ffee),
          textTheme: Theme
              .of(context)
              .textTheme
              .copyWith(caption: new TextStyle(color: const Color(0xfff4f4f4)))), // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //changes page index on bar
        currentIndex: pageIndex,
        onTap: (int index){
          setState(() {
            pageIndex = index;
          });
        },
        //nav bar items
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.group),
            title: new Text('Groups'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.shopping_basket),
            title: new Text('Shopping List'),
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.account_balance),
            title: new Text('Balance'),
          )
        ],
      ),
    );
  }
}