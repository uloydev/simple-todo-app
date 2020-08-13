import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/home_layout.dart';

class MainSection extends StatefulWidget {
  @override
  _MainSectionState createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      title: 'My Todos',
      child: Center(
        child: Text('main Section'),
      ),
    );
  }
}
