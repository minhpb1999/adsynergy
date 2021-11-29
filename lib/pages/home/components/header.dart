import 'package:ad_synergy/pages/home/search/publication_search/publication_search.dart';

import '../search/swap_search/swap_search.dart';
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
        onPressed: (){
          _openSearchOptions(context);
        },
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

void _openSearchOptions(context) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          //backgroundColor: Color(0xffc8e6c9),
            title: Text('What are you looking for?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff5ac18e),
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            actions: <Widget>[
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
//                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ButtonTheme(
                            minWidth: 25.0,
                            height: 25.0,
                            child: OutlineButton(
                                borderSide: BorderSide(color: Colors.black26),
                              textColor: Colors.black,
                                child: new Text("Products and Brands",
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                onPressed: () {},
                            ),
                        ),
                        SizedBox(width: 8.0),
                        ButtonTheme(
                          minWidth: 25.0,
                          height: 25.0,
                          child: OutlineButton(
                            borderSide: BorderSide(color: Colors.black26),
                            textColor: Colors.black,
                            child: new Text("Publications",
                              style: TextStyle(
                                fontSize: 18,
                              ),),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => PublicationSearch()));
                            },
                          ),
                        ),
                        SizedBox(width: 8.0),
                        ButtonTheme(
                          minWidth: 25.0,
                          height: 25.0,
                          child: OutlineButton(
                            borderSide: BorderSide(color: Colors.black26),
                            textColor: Colors.black,
                            child: new Text("Swap partners",
                              style: TextStyle(
                                fontSize: 18,
                              ),),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SwapSearch()));
                            },
                          ),
                        ),
                      ],
                  ),
              ),
            ]
        );
      });
}