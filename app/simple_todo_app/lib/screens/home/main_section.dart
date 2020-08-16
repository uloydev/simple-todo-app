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
      isMain: true,
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        children: [
          TodoItem(
            text: 'Mantap sayang',
          ),
          TodoItem(
            text:
                'Mantap sayan wkdsa wiasdhald wduapdujaksdjw wudaopdjas [wpa ida aal jdwiojds;d0w a',
          ),
          TodoItem(
            text:
                'Mantap sayan wkdsa wiasdhald wduapdujaksdjw wudaopdjas [wpa ida aal jdwiojds;d0w a',
          ),
          TodoItem(
            text:
                'Mantap sayan wkdsa wiasdhald wduapdujaksdjw wudaopdjas [wpa ida aal jdwiojds;d0w a',
          ),
          TodoItem(
            text: 'Mantap sayang',
          ),
          TodoItem(
            text: 'Mantap sayang',
          ),
          TodoItem(
            text: 'Mantap sayang',
          ),
          TodoItem(
            text: 'Mantap sayang',
          ),
        ],
      ),
    );
  }
}
