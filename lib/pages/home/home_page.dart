import 'advertiser/campaign.dart';
import 'advertiser/products.dart';
import 'profiles_childrent/profile.dart';
import 'package:ad_synergy/pages/home/publisher/ads.dart';
import 'package:ad_synergy/pages/home/publisher/extra.dart';
import 'package:ad_synergy/pages/home/publisher/placement.dart';
import 'package:ad_synergy/pages/home/publisher/publication.dart';
import 'package:ad_synergy/pages/home/publisher/stats.dart';
import 'package:ad_synergy/pages/home/swap/swap.dart';
import 'advertiser/ads.dart';
import 'advertiser/placements.dart';
import 'components/header.dart';
import 'message/message.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'offers/offers.dart';

class HomePage extends StatefulWidget {
  _HomePageState createState() => new _HomePageState();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  String _userType = 'Publisher';
  int _selectedIndex = 0;
  var _listItems = [];
  var listPublisherItems = [
    {
      "title": 'Publications',
      "icon": Icons.publish,
      "onPressed": Publication()
    },
    {
      "title": 'Slots',
      "icon": Icons.stacked_line_chart,
      "onPressed": ExtraPage()
    },
    {
      "title": 'Placements',
      "icon": Icons.location_city,
      "onPressed": Placement()
    },
    {
      "title": 'Ads',
      "icon": Icons.card_membership,
      "onPressed": AdsPage()
    },
    {
      "title": 'Stats',
      "icon": Icons.data_usage,
      "onPressed": ChartListView(
        items: List<ListItem>.generate(1,
              (i) => HeadingItem(),
        ),)
    },
    {
      "title": 'Inventory',
      "icon": Icons.inventory,
      "onPressed": ExtraPage()
    },
    {
      "title": 'ROI',
      "icon": Icons.waterfall_chart,
      "onPressed": ExtraPage()
    }
  ];
  var listAdvertiserItems = [
    {
      "title": 'Products',
      "icon": Icons.storefront,
      "onPressed": Products()
    },
    {
      "title": 'Ads',
      "icon": Icons.card_membership,
      "onPressed": AdvertisementAdsPage()
    },
    {
      "title": 'Campaigns',
      "icon": Icons.campaign,
      "onPressed": Campaign()
    },
    {
      "title": 'Placements',
      "icon": Icons.location_city,
      "onPressed": AdvertisementPlacement()
    },
    {
      "title": 'Stats',
      "icon": Icons.data_usage,
      "onPressed": ChartListView(
        items: List<ListItem>.generate(1,
              (i) => HeadingItem(),
        ),)
    },
    {
      "title": 'ROI',
      "icon": Icons.waterfall_chart,
      "onPressed": ExtraPage()
    },
  ];

  static List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    OfferScreen(),
    MessageScreen(),
    SwapScreen(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void changeUserType(String type) {
    setState(() {
      _userType = type;
    });
    switch (type) {
      case 'Publisher':
        {
          setState(() {
            _listItems = listPublisherItems;
          });
          //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>super.widget));
        }
        break;
      case 'Advertiser':
        {
          setState(() {
            _listItems = listAdvertiserItems;
          });
        }
        break;
      default:
        {}
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: widget.scaffoldKey,
        appBar: header(
        context,
        function: () => widget.scaffoldKey.currentState.openDrawer(),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: getDrawer(),
        ),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Color(0xff5ac18e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offers',
            backgroundColor: Color(0xff5ac18e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Messages',
            backgroundColor: Color(0xff5ac18e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.swap_horizontal_circle_outlined),
            label: 'Swap',
            backgroundColor: Color(0xff5ac18e),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: 'Profiles',
            backgroundColor: Color(0xff5ac18e),
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
        selectedItemColor: Color(0xff5ac18e),
        onTap: _onItemTapped,
      ),
    );
  }

  List<Widget> getDrawer() {
    List<Widget> drawer = [];
    drawer.add(Container(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      child: DrawerHeader(
          decoration: BoxDecoration(
            color: Color(0xff5ac18e),
          ),
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 43,
                          backgroundColor: Colors.white,
                          child: Image.asset(
                            'assets/images/user.png',
                            width: 86,
                            height: 86,
                          )),
                      Padding(
                          padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Tony Stark',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'tonystark@gmail.com',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          )),
                    ]),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Theme(
                  data: Theme.of(context).copyWith(
                    canvasColor: const Color(0xffe0f2f1),
                  ),
                  child: DropdownButton(
                    value: _userType,
                    icon: const Icon(Icons.arrow_drop_down),
                    onChanged: (String newValue) => changeUserType(newValue),
                    underline: Container(height: 0),
                    items: <String>['Publisher', 'Advertiser']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle(color: Colors.black),),
                      );
                    }).toList(),
                  ),
                ),
              )
            ],
          )),
    ));
    if (_listItems.length == 0) {
      _listItems = listPublisherItems;
    }
    for (var i = 0; i < _listItems.length; i++) {
      drawer.add(Card(
        shadowColor: Colors.white,
        child: ListTile(
          title: Text(_listItems[i]["title"]),
          leading: Icon(_listItems[i]["icon"]),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => _listItems[i]["onPressed"])))));
    }
    return drawer;
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _Type;
  TableRow buildTableRow({String publication, String slot, String placement, String impression_click}){
    return TableRow(
      children: <Widget>[
        Container(
          height: 30,
          child: Center(
            child: Text(publication),
          ),
        ),
        Center(
          child: Text(slot),
        ),
        Center(
          child: Text(placement),
        ),
        Center(
          child: Text(impression_click,
          ),
        ),
      ],
    );
  }

  buildAdvertiserView(){
    return Text('Advertiser');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      height: double.infinity,
      child: Table(
//        border: TableBorder.all(),
        columnWidths: const <int, TableColumnWidth>{
          0: FlexColumnWidth(),
          1: FixedColumnWidth(64),
          2: FlexColumnWidth(),
          3: FlexColumnWidth()
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: <TableRow>[
          TableRow(
            children: <Widget>[
              Container(
                height: 30,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    'Publisher ',
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Roboto',
                    ),
                  ),
                ),
              ),
              SizedBox(),
              SizedBox(),
              SizedBox(),
            ]
          ),
          TableRow(
            children: <Widget>[
              Container(
                height: 50,
                child: Center(
                  child: Text('Publication',
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),),
                ),
              ),
              Center(
                child: Text('# Slots',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),),
              ),
              Center(
                child: Text('# Placements',
                  style: TextStyle(
                    color: Color(0xff5ac18e),
                    fontSize: 16,
                    fontFamily: 'Roboto',
                  ),),
              ),
              Center(
                child: Text('#Impressions  / Clicks',
                    style: TextStyle(
                      color: Color(0xff5ac18e),
                      fontSize: 16,
                      fontFamily: 'Roboto',
                    ),
                ),
              ),
            ],
          ),
          buildTableRow(
            publication: 'Subject A',
            slot: '0',
            placement: '0',
            impression_click: '0/0',
          ),
          buildTableRow(
            publication: 'Subject B',
            slot: '0',
            placement: '0',
            impression_click: '0/0',
          )
        ],
      ),
    );
  }
}



