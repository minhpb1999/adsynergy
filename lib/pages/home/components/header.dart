import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

AppBar header(context, {Function function}) {
  return AppBar(
    backgroundColor: Color(0xff5ac18e),
    leading: IconButton(
      icon: Icon(Icons.menu, color: Colors.white),
//      onPressed: () => widget.scaffoldKey.currentState.openDrawer(),
        onPressed: function,
    ),
    actions: <Widget>[
      IconButton(
        icon: Icon(Icons.search, color: Colors.white),
        tooltip: 'Search',
        onPressed: (){},
      ),
      PopupMenuButton<String>(
        icon: Icon(Icons.more_horiz, color: Colors.white,),
        onSelected: (val) => handleClick(val, context),
        itemBuilder: (BuildContext context) {
          return {'Help','Feedback','Logout',}.map((String choice) {
            return PopupMenuItem<String>(
              value: choice,
              child: Text(choice),
            );
          }).toList();
        },
      ),
    ],
  );
}

class Search extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: false,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Search for...',
        hintStyle: TextStyle(
          fontSize: 17,
          color: Colors.white,
        ),
      ),
    );
  }
}


void handleClick(String value, BuildContext context) {
  switch (value) {
    case 'Help':
      break;
    case 'Feedback':
      _openPopup(context);
      break;
    case 'Logout':
      break;
  }
}

void _openPopup(context) {
  Alert(
      context: context,
      title: "FEEDBACK",
      content: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              icon: Icon(Icons.feedback),
              labelText: 'Your feedback',
            ),
          ),
          TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.email),
              labelText: 'Email for respones',
            ),
          ),
        ],
      ),
      buttons: [
        DialogButton(
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Send",
            style: TextStyle(color: Colors.white, fontSize: 15),
          ),
        )
      ]).show();
}