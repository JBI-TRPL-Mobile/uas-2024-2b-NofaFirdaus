import 'package:flutter/material.dart';
import 'package:template_project/pages/home/dashboard_page.dart';
import 'package:template_project/pages/home/message_page.dart';
import 'package:template_project/pages/home/profile_page.dart';

class DrawerComponent extends StatefulWidget {
  const DrawerComponent({super.key});

  @override
  State<DrawerComponent> createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
    int _currentIndex = 0;
    final _pages = [
     DashboardPage(),
    const MessagePage(),
    ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.airlines),
          //   label: 'notifikasi',
          // ),
       
        ],
      ),
    );
  }
  }