import 'package:flutter/material.dart';

BottomNavigationBar footer(context){
  return BottomNavigationBar(
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
    //currentIndex: _selectedIndex,
    unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
    selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
    selectedItemColor: Color(0xff5ac18e),
    //onTap: _onItemTapped,
  );
}