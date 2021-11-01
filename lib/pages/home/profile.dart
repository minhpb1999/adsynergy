import 'package:ad_synergy/pages/home/profiles_childrent/advertiser_profile.dart';
import 'package:ad_synergy/pages/home/profiles_childrent/corporate_profile.dart';
import 'package:ad_synergy/pages/home/profiles_childrent/professional_profile.dart';
import 'package:ad_synergy/pages/home/profiles_childrent/publisher_profile.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

//enum role { advOnly, pubOnly, mainlyAdv, mainlyPub }
class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {

  //role _role = role.advOnly;
  String _role = "Advertiser Only";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: <Widget>[
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.topRight,
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: const Color(0xffe0f2f1),
              ),
              child: DropdownButton(
                value: _role,
                icon: const Icon(Icons.arrow_drop_down),
                onChanged: (String newValue) =>
                    setState(() {
                  _role = newValue;
                }),
                underline: Container(height: 0),
                items: <String>['Advertiser Only' , 'Publisher Only', 'Mainly Advertiser', 'Mainly Publisher']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: TextStyle(color: Colors.black),),
                  );
                }).toList(),
              ),

            ),

          ),

          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
              padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Color(0xffc8e6c9),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (BuildContext context) => CorporateProfile()),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Text(
                      "Corporate Profile",
                      style: Theme.of(context).textTheme.bodyText1,)
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Color(0xffc8e6c9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => ProfessionalProfile()),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Text(
                      "Professional Profile",
                      style: Theme.of(context).textTheme.bodyText1,)
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Color(0xffc8e6c9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => AdvertiserProfile()),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Text(
                      "Advertiser Profile",
                      style: Theme.of(context).textTheme.bodyText1,)
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: FlatButton(
                padding: EdgeInsets.all(20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                color: Color(0xffc8e6c9),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (BuildContext context) => PublisherProfile()),
                  );
                },
                child: Row(
                  children: [
                    Expanded(child: Text(
                      "Publisher Profile",
                      style: Theme.of(context).textTheme.bodyText1,)
                    ),
                    Icon(Icons.arrow_forward_ios)
                  ],
                )
            ),
          ),
        ],)
    );
  }
}