import 'package:flutter/material.dart';

//function similar to the "displayMsg" in sequence diagrams
class Dialogs{

  //simple information diaglog which shows a title and has a description
  information(BuildContext context, String title, String description)
  {
    if (title == null){
      title = 'Invalid Title Provided';
    }

    if (description == null){
      description = 'Error: content could\'t be reached';
    }
    return showDialog(
        context: context,
      barrierDismissible: true,
      builder: (BuildContext context){
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text(description)
                ],
              ),
            ),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('close'),
                )
            ],
          );
      }
    );
  }
}
