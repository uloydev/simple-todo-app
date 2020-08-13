import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:simple_todo_app/screens/home/history_section.dart';
import 'package:simple_todo_app/screens/home/main_section.dart';
import 'package:simple_todo_app/screens/home/profile_section.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> sections = [HistorySection(), MainSection(), ProfileSection()];
  int activeIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: sections[activeIndex],
      bottomNavigationBar: CurvedNavigationBar(
          index: 1,
          color: Colors.blueAccent,
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.blueAccent,
          height: 50,
          animationDuration: Duration(milliseconds: 500),
          items: [
            Icon(
              Icons.perm_media,
              color: Colors.white,
            ),
            Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            Icon(
              Icons.dashboard,
              color: Colors.white,
            ),
          ],
          onTap: onBottomNavTap,
      ),
    );
  }

  void onBottomNavTap(index){
          setState(() {
            activeIndex = index;
          });
        }
}
