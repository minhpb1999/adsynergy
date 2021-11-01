import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../home_page.dart';

class ProfessionalProfile extends StatefulWidget {
  @override
  _ProfessionalProfileState createState() => _ProfessionalProfileState();
}

enum Share { Private, Public }

class _ProfessionalProfileState extends State<ProfessionalProfile> {
  Share _share = Share.Private;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ac18e),
        title: Text('Professional Profile'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info),
              onPressed: (){
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Corporate Profile',
                          style: TextStyle(
                            color: Color(0xff5ac18e),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        content: Text('Your corporate profile is a public document that describes your organization to the world. It is intended to help attract and encourage advertisers to do business with you.'),
                      );
                    });
              }
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20.0),
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            //color: Color(0xffE0FFD0),
            border: Border.all(
              color: Color(0xff5ac18e),
              width: 3,
            ),
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'First Name: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              TextField(
//              keyboardType: TextInputType.multiline,
//              maxLines: null,
                decoration: InputDecoration(
                  hintText: 'First name/ Given name.',
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Last Name: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
//                style: TextStyle(
//                  height: 6,
//                ),
                decoration: InputDecoration(
                  hintText: 'Last Name/ Sur Name.',

                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Profile: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              TextField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Describe yourself to potential partenrs.',
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Share: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              RadioListTile<Share>(
                title: const Text('Private'),
                value: Share.Private,
                groupValue: _share,
                onChanged: (Share value) {
                  setState(() {
                    _share = value;
                  });
                },
              ),
              RadioListTile<Share>(
                title: const Text('Public'),
                value: Share.Public,
                groupValue: _share,
                onChanged: (Share value) {
                  setState(() {
                    _share = value;
                  });
                },
              ),
              RaisedButton(
                elevation: 5,
                onPressed: (){
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                            title: Text('Do you want to save your change?',
                              style: TextStyle(
                                color: Color(0xff5ac18e),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Roboto',
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () => Navigator.pop(context, 'Cancel'),
                                child: const Text('Cancel',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () => Navigator.push(context, new MaterialPageRoute(builder: (context) => new HomePage())),
                                child: const Text('OK',
                                  style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Roboto',
                                  ),
                                ),
                              ),
                            ]
                        );
                      });
                },
                padding: EdgeInsets.all(15),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Color(0xffc8e6c9),
                //  child:
                child: Text(
                  'Add My Profile',
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
