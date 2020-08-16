import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/history_todo_item.dart';
import 'package:simple_todo_app/components/home_layout.dart';

class HistorySection extends StatefulWidget {
  @override
  _HistorySectionState createState() => _HistorySectionState();
}

class _HistorySectionState extends State<HistorySection> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      title: 'History',
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        children: [
          HistoryTodoItem(text: 'lorem ipsum.',)
        ],
      ),
    );
  }
}
