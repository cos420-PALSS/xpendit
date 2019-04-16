import 'domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


int pageIndex = 0;

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
        home: new Page());
  }
}

//This class builds the page
//The page index is the current page
//It keeps the bottom nav bar static (doesn't reload on page change)
class Page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    if (pageIndex == 0) {
      return new Scaffold(
          body: Container(
              child:
              new Home()
          ),
          bottomNavigationBar: NavBar()
      );
    } else if(pageIndex == 1){
      return new Scaffold(
          body: Container(
              child:
              new Groups()
          ),
          bottomNavigationBar: NavBar()
      );
    } else if(pageIndex == 2){
      return new Scaffold(
          body: Container(
              child:
              new ShoppingList()
          ),
          bottomNavigationBar: NavBar()
      );
    } else if(pageIndex == 3){
      return new Scaffold(
          body: Container(
              child:
              new Balance()
          ),
          bottomNavigationBar: NavBar()
      );
    }
  }
}
class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        body: Container(
          //color: Colors.blue,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: new Text("Home",
                    style: new TextStyle(
                        fontSize: 30.0, color: const Color(0xfff4f4f4))),
              ),
              new Title()
            ],
          ),
        ),
    );
  }
}

class Groups extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        body: Container(
          //color: Colors.blue,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: new Text("Groups",
                    style: new TextStyle(
                        fontSize: 30.0, color: const Color(0xfff4f4f4))),
              ),
              new Title()
            ],
          ),
        ),
    );
  }
}

class ShoppingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        body: Container(
          //color: Colors.blue,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: new Text("Shopping List",
                    style: new TextStyle(
                        fontSize: 25.0, color: const Color(0xfff4f4f4))),
              ),
              new Title()
            ],
          ),
        ),
    );
  }
}

class Balance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        body: Container(
          //color: Colors.blue,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 50.0, left: 10.0),
                child: new Text("Balance",
                    style: new TextStyle(
                        fontSize: 30.0, color: const Color(0xfff4f4f4))),
              ),
              new Title()
            ],
          ),
        ),
    );
  }
}

class Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 30, right: 10),
      //alignment: Alignment.topRight,
      child: new Text(
        "Xpendit",
        style: new TextStyle(fontSize: 45.0, color: const Color(0xfffc7eb7)),
      ),
    );
  }
}

//navigation bar class
class NavBar extends StatefulWidget {
  @override
  _NavBar createState() => _NavBar();
}

class _NavBar extends State<NavBar> {
  //int pageIndex = 0; //default page

  @override
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(
          // sets the background color of the `BottomNavigationBar`
          canvasColor: const Color(0xff3b3a43),
          // sets the active color of the `BottomNavigationBar` if `Brightness` is light
          primaryColor: const Color(0xff00ffee),
          textTheme: Theme.of(context).textTheme.copyWith(
              caption: new TextStyle(
                  color: const Color(
                      0xfff4f4f4)))), // sets the inactive color of the `BottomNavigationBar`
      child: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //changes page index on bar
        currentIndex: pageIndex,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Page()),
            );
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
