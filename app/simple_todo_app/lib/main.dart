import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple TODO App',
      home: Scaffold(
        appBar: AppBar(title: Text('Home page'), backgroundColor: Colors.blueAccent,),
        backgroundColor: Colors.black,
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          buttonBackgroundColor: Colors.blueAccent,
          color: Colors.blueAccent,
          height: 50,
          animationDuration: Duration(
            milliseconds: 300,
          ),
          items: <Widget>[
            Icon(Icons.add, size: 30, color: Colors.white,),
            Icon(Icons.add, size: 30, color: Colors.white,),
            Icon(Icons.add, size: 30, color: Colors.white,),
          ],
          onTap: (index) {
            //Handle button tap
          },
        ),
        body: Container(color: Colors.white),
      ),
    );
  }
}
