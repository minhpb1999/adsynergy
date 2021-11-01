import 'package:flutter/material.dart';

import '../home_page.dart';

class OfferedView extends StatefulWidget {
  final String offeredByPub;
  final String offeredBySlot;
  final String offeredToPub;
  final String offeredToSlot;
  OfferedView({this.offeredByPub, this.offeredBySlot, this.offeredToPub, this.offeredToSlot});

  @override
  _OfferedViewState createState() => _OfferedViewState();
}

class _OfferedViewState extends State<OfferedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ac18e),
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
                  'From: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                  'Publication:  ${widget.offeredByPub}',
                  style: TextStyle(
                    fontSize: 17,
                  ),
                ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Slot: ${widget.offeredBySlot}',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Ad Set: ',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'To: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Publication: ${widget.offeredToPub}',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Slot:  ${widget.offeredToSlot}',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'Ad Set:  ',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Date: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    'From:  2021-10-28 to 2020-12-31',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Max Impressions: ',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Text(
                    '99999',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
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
                  'Accept',
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
