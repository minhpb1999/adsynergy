import 'package:ad_synergy/pages/home/message/send_message.dart';
import 'package:flutter/material.dart';

class PublicationSearch extends StatefulWidget {
  @override
  _PublicationSearchState createState() => _PublicationSearchState();
}

class _PublicationSearchState extends State<PublicationSearch> {
  bool _isSearch = false;
  bool _isSlot = false;
  @override
  void initState() {
    super.initState();
    _isSearch = false;
    _isSlot = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Publications'),
        backgroundColor: Color(0xff5ac18e),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.black38.withAlpha(10),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Keyword",
                        hintStyle: TextStyle(
                          color: Colors.black.withAlpha(120),
                        ),
                        border: InputBorder.none,
                      ),
                      onChanged: (String keyword) {},
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        _isSearch = true;
                      });
                    },
                    child: Icon(
                      Icons.search,
                      color: Colors.black.withAlpha(120),
                    ),
                  )
                ],
              ),
            ),
            _isSearch ? _results(context) : SizedBox(height: 8.0,),
            _isSlot ? _buildSlotResults() : SizedBox(height: 5.0,),
          ],
        ),
      ),
    );
  }

  Widget _buildSlotResults(){
    var slots = [
      slotsResults(context, 'iCM Bottom Banner', 'Bottom of the page banner','468 x 60', 'text, html, image', '2019-01-01, 2020-01-01'),
      slotsResults(context, 'iCM Bottom Right 1/2 Banner', '','234 x 60', 'text, html, image', '2019-01-01, 2020-01-01'),
      slotsResults(context, 'iCM Bottom Left Half Banner', 'iCM Bottom Left Half Banner','234 x 60', 'text, html, image, gif', '2019-01-01, 2020-01-01'),
    ];
    return Column(children: slots,);
  }

  Widget _results(context){
    return SingleChildScrollView(
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
                'Name: ',
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
                  'Ad Set ',
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
                'Web Site: ',
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
                  'Ad Set  ',
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
                'Description: ',
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
            SizedBox(height: 20,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  elevation: 5,
                  onPressed: (){
                    setState(() {
                      _isSlot = !_isSlot;
                    });
                  },
                  padding: EdgeInsets.all(15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Color(0xffc8e6c9),
                  //  child:
                  child: Text(
                    'Slots',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                RaisedButton(
                  elevation: 5,
                  onPressed: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SendMessage('Ad Set')));
                  },
                  padding: EdgeInsets.all(15),

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  color: Color(0xffc8e6c9),
                  //  child:
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16,),

          ],
        ),
      ),
    );
  }
  Widget slotsResults(context, String name, String des, String hw, String media, String dates){

    return InkWell(
      onTap: () {
        openBottomSheet(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          //height: 80.0,
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
                                'Slot Name: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                name,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Description: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                des,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Height x Wight: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                hw,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Media: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                media,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                'Dates: ',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0),
                              ),
                              SizedBox(width: 5.0,),
                              Text(
                                dates,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14.0),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openBottomSheet(context) {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          var dropdownValue= 'option1';
          var CMP = 'Cost Per Click';
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 550.0,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Starting On: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                      style: TextStyle(
                        height: 1.0,
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 15.0,),
                    Text(
                      'Ending On: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'year-mo-dy, Leave blank for open ended',
                      ),
                      style: TextStyle(
                        height: 1.0,
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: <Widget>[
                        Text(
                          'Ad Set:',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        SizedBox(width: 10.0,),
                        DropdownButton(
                          value: dropdownValue,
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          underline: Container(height: 0),
                          items: <String>['option1', 'option2']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(color: Colors.black),),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.0,),
                    Text(
                      'Maximum Count: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '',
                      ),
                      style: TextStyle(
                        height: 1.0,
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),
                    SizedBox(height: 5.0,),
                    Row(
                      children: <Widget>[
                        Text(
                          'CPM or CPC: ',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0),
                        ),
                        SizedBox(width: 10.0,),
                        DropdownButton(
                          value: CMP,
                          icon: const Icon(Icons.arrow_drop_down),
                          onChanged: (String newValue) {
                            setState(() {
                              dropdownValue = newValue;
                            });
                          },
                          underline: Container(height: 0),
                          items: <String>['Cost Per Click', 'Cost Per Impression', 'Ad Swap']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(color: Colors.black),),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    Text(
                      'Unit Value: ',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0),
                    ),
                    TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '0.10',
                      ),
                      style: TextStyle(
                        height: 1.0,
                        color: Colors.black,
                        fontSize: 14.0,
                      ),
                    ),

                    SizedBox(height: 5.0,),

                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: (){
                          },
                          child: Container(
                            width: 170,
                            decoration: BoxDecoration(
                                color: Colors.blue[50],
                                borderRadius: BorderRadius.circular(30.0)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: <Widget>[
                                  Text(" Make Offer", style: TextStyle(
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
}
