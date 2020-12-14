import 'package:courses/screens/bottomnavbar/courses.dart';
import 'package:courses/screens/bottomnavbar/homepage.dart';
import 'package:courses/screens/bottomnavbar/profile.dart';
import 'package:flutter/material.dart';




class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

List screens = [
  HomePage(), Courses(), Profile()
];

int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff4f4fb),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 3.0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile'
          ),
        ],
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
        selectedIconTheme: IconThemeData(color: Colors.indigo[600], size: 20.0),
        selectedItemColor: Colors.indigo[600],
        selectedLabelStyle: TextStyle(color: Colors.indigo[600], fontSize: 15.0, fontWeight: FontWeight.bold),
        unselectedIconTheme: IconThemeData(color: Colors.grey, size: 20.0),
        unselectedItemColor: Colors.grey,
        unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 15.0, fontWeight: FontWeight.bold),
      ),
      body: screens[current],
    );
  }
}