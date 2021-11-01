import 'package:ad_synergy/pages/home/swap/offered_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SwapScreen extends StatefulWidget {
  @override
  _SwapScreenState createState() => _SwapScreenState();
}

class _SwapScreenState extends State<SwapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Offered: ',
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              OfferDisplay(
                offeredByPub: 'PubA',
                offeredBySlot: 'Slot1',
                offeredToPub: 'PubB',
                offeredToSlot: 'Slot2',
              ),
              SizedBox(
                height: 10.0,
              ),
              OfferDisplay(
                offeredByPub: 'PubA',
                offeredBySlot: 'Slot1',
                offeredToPub: 'PubB',
                offeredToSlot: 'Slot2',
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Accepted: ',
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              OfferDisplay(
                offeredByPub: 'PubA',
                offeredBySlot: 'Slot1',
                offeredToPub: 'PubB',
                offeredToSlot: 'Slot2',
              ),
              SizedBox(
                height: 10.0,
              ),
              OfferDisplay(
                offeredByPub: 'PubA',
                offeredBySlot: 'Slot1',
                offeredToPub: 'PubB',
                offeredToSlot: 'Slot2',
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Declined: ',
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OfferDisplay extends StatelessWidget {
  String offeredByPub;
  String offeredBySlot;
  String offeredToPub;
  String offeredToSlot;

  OfferDisplay({this.offeredByPub, this.offeredBySlot, this.offeredToPub, this.offeredToSlot});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //OfferedView(context, sender, subject);
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) =>
                OfferedView(
                    offeredByPub: offeredByPub,
                    offeredBySlot: offeredBySlot,
                    offeredToPub: offeredToPub,
                    offeredToSlot: offeredToSlot,
                )));
      },
      child: Container(
        height: 130.0,
        width: 350.0,
        decoration: BoxDecoration(
          color: Color(0xffc8e6c9),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Offered By Publication / Slot Name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                        Text(
                          '$offeredByPub / $offeredBySlot',
                          style: TextStyle(
                              color: Colors.black, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Offered To Publication / Slot Name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0),
                            ),
                          ],
                        ),
                        Text(
                          '$offeredToPub / $offeredToSlot',
                          style: TextStyle(
                              color: Colors.black, fontSize: 14.0),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Click for more details",
                              style: TextStyle(
                                  color: Colors.black, fontSize: 12.0),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

