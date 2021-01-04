import 'package:flutter/material.dart';

import '../constants.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top:5,left: 20, right: 20),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          iconSize: 26,
          unselectedItemColor: kGrey,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w700),
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: [
            BottomNavigationBarItem(
              label: "Comunidade",
              icon:  Icon(Icons.people_alt_rounded),
              backgroundColor: kLightYellow,
            ),
            BottomNavigationBarItem(
              label: "Explorar",
              icon: Icon(Icons.location_on),
            ),
            BottomNavigationBarItem(
              label: "Lista",
              icon:  Icon(Icons.list_rounded),
            ),
          ],
          onTap: (index){
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
    );
  }
}