import 'package:flutter/material.dart';
import 'package:wlf/main.dart';
import 'package:wlf/res/color.dart';
import 'package:wlf/screens/notifications.dart';
import 'package:wlf/screens/settings.dart';
import '../screens/blog.dart';
import '../screens/contactus.dart';

class BottomNavigationBarController extends StatefulWidget {
  @override
  _BottomNavigationBarControllerState createState() =>
      _BottomNavigationBarControllerState();
}

class _BottomNavigationBarControllerState
    extends State<BottomNavigationBarController> {
  final List<Widget> pages = [
    BlogPage(
      key: PageStorageKey('Page1'),
    ),
    NotificationScreen(
      key: PageStorageKey('Page2'),
    ),
    ContactUs(
      key: PageStorageKey('Page3'),
    ),
    Settings(
      key: PageStorageKey('Page4'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
        onTap: (int index) => setState(() => _selectedIndex = index),
        currentIndex: selectedIndex,
        iconSize: 28,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        backgroundColor: mainColor,
        showUnselectedLabels: true,
        selectedFontSize: 16,
        selectedItemColor: accent,
        unselectedItemColor: Colors.white,
        selectedLabelStyle: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text(
              'Blogs',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            title: Text(
              'Notifications',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(
              'Contact Us',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text(
              'Settings',
              style: TextStyle(fontFamily: 'NHGTX'),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
    );
  }
}