import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SendMessage extends StatefulWidget {
  @override
  _SendMessageState createState() => _SendMessageState();
}

class _SendMessageState extends State<SendMessage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ac18e),
        title: Text('Create new message'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            buildTextField(title: 'To'),
            SizedBox(height: 8,),
            buildTextField(title: 'Cc'),
            SizedBox(height: 8,),
            buildTextField(title: 'Subject'),
            SizedBox(height: 8,),
            buildTextField(title: 'Message', maxlines: 10),
            SizedBox(height: 8,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff5ac18e),
                minimumSize: Size.fromHeight(50),
                textStyle: TextStyle(
                  fontSize: 16
                )
              ),
                onPressed: (){},
                child: Text('SEND'),
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField({String title, int maxlines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Color(0xff5ac18e),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        TextField(
          maxLines: maxlines,
          style: TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            //contentPadding: EdgeInsets.only(top: 0, bottom: 0, left: 10, right: 10),
            border: OutlineInputBorder(),
          ),
        )
      ],
    );
  }
}
