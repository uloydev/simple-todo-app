import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/home_layout.dart';
import 'package:simple_todo_app/components/todo_item.dart';

class MainSection extends StatefulWidget {
  @override
  _MainSectionState createState() => _MainSectionState();
}

class _MainSectionState extends State<MainSection> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      title: 'My Todos',
      child: Container(
        margin: EdgeInsets.only(top: 15),
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
          children: [
            TodoItem(text: 'Mantap sayang',),
            TodoItem(text: 'Mantap sayan wkdsa wiasdhald wduapdujaksdjw wudaopdjas [wpa ida aal jdwiojds;d0w a',),
            TodoItem(text: 'Mantap sayan wkdsa wiasdhald wduapdujaksdjw wudaopdjas [wpa ida aal jdwiojds;d0w a',),
            TodoItem(text: 'Mantap sayan wkdsa wiasdhald wduapdujaksdjw wudaopdjas [wpa ida aal jdwiojds;d0w a',),
            TodoItem(text: 'Mantap sayang',),
            TodoItem(text: 'Mantap sayang',),
            TodoItem(text: 'Mantap sayang',),
            TodoItem(text: 'Mantap sayang',),
          ],
        ),
      ),
    );
  }
}
