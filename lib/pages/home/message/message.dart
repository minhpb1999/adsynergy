
import 'send_message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessageScreen extends StatefulWidget {
  @override
  _MessageScreenState createState() => _MessageScreenState();
}

enum status { news, read, sent, threads }

class _MessageScreenState extends State<MessageScreen> {

  status _status = status.news;

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
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: <Widget>[
                    ViewOption(
                      onTap: (){
                        setState(() {
                          _status = status.news;
                        });
                      },
                      status: 'NEW',
                      number: 3,
                      colour: _status == status.news ? Color(0xff5ac18e) : Colors.white,
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    ViewOption(
                      onTap: (){
                        setState(() {
                          _status = status.read;
                        });
                      },
                      status: 'READ',
                      number: 3,
                      colour: _status == status.read ? Color(0xff5ac18e) : Colors.white,
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    ViewOption(
                      onTap: (){
                        setState(() {
                          _status = status.sent;
                        });
                      },
                      status: 'SEND',
                      number: 3,
                      colour: _status == status.sent ? Color(0xff5ac18e) : Colors.white,
                    ),
                    SizedBox(
                      width: 9.0,
                    ),
                    ViewOption(
                      onTap: (){
                        setState(() {
                          _status = status.threads;
                        });
                      },
                      status: 'THREADS',
                      number: 3,
                      colour: _status == status.threads ? Color(0xff5ac18e) : Colors.white,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              MailDisplay(
                sender: 'Person A',
                subject: 'Subject A',
              ),
              SizedBox(
                height: 10.0,
              ),
              MailDisplay(
                sender: 'Person B',
                subject: 'Subject B',
              ),
              SizedBox(
                height: 10.0,
              ),
              MailDisplay(
                sender: 'Person C',
                subject: 'Subject C',
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (BuildContext context) => SendMessage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Color(0xff5ac18e),
      ),
    );
  }
}

class ViewOption extends StatelessWidget {
  String status;
  int active;
  int number;
  Color colour;
  Function onTap;
  ViewOption({this.status, this.number, this.onTap, this.colour});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
//                      margin: EdgeInsets.all(2.0),
        padding: EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5.0, right: 5.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: colour,
        ),
        child: Row(
          children: <Widget>[
            Text(
              status,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
               '(${number.toString()})',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MailDisplay extends StatelessWidget {
  String sender;
  String subject;

  MailDisplay({this.sender, this.subject});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        openBottomSheet(context, sender, subject);
      },
      child: Container(
        height: 95.0,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text(
                            sender,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          Spacer(),
                          Text(
                            "8:16 AM",
                            style: TextStyle(
                                color: Colors.grey, fontSize: 12.0),
                          ),
                        ],
                      ),
                      Text(
                        subject,
                        style: TextStyle(
                            color: Colors.black, fontSize: 14.0),
                      ),
                      SizedBox(
                        height: 3.0,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "You have a mail. Check it!",
                            style: TextStyle(
                                color: Colors.black, fontSize: 12.0),
                          ),
                          Spacer(),
                        ],
                      )
                    ],
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

void openBottomSheet(context, String sender, String subject) {
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext bc) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            height: 500.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Text(
                                    sender,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16.0),
                                  ),
                                  Spacer(),
                                  Icon(
                                    Icons.delete_outline,
                                    color: Color(0xff5ac18e),
                                  ),
                                  Icon(
                                    Icons.more_vert,
                                    color: Color(0xff5ac18e),
                                  ),
                                ],
                              ),
                              Text(
                                subject,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),

                  SizedBox(height: 20.0,),

                  Text("Code,", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  SizedBox(height: 10.0,),
                  Text(
                    "AdSynergy is launching a FREE AD SWAP service, to help local business get online traffic and generate revenue",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0
                    ),),
                  SizedBox(height: 30.0,),
                  Text("Thank you,", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),),
                  SizedBox(height: 5.0,),
                  Text("Code Warriors", style: TextStyle(
                      color: Colors.black,
                      fontSize: 18.0
                  ),),
                  SizedBox(height: 15.0,),

                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SendMessage()));
                        },
                        child: Container(
                          width: 120,
                          decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(30.0)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: <Widget>[
                                Text(" Reply", style: TextStyle(
                                    color: Colors.blueGrey,
                                    fontSize: 18.0
                                ),),
                                SizedBox(width: 10.0,),
                                CircleAvatar(
                                  backgroundColor: Color(0xff5ac18e),
                                  child: Icon(
                                    Icons.arrow_forward, color: Colors.white,),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
}