import 'package:flutter/material.dart';

class HistoryTodoItem extends StatelessWidget {
  const HistoryTodoItem({Key key, this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 6,
            offset: Offset(0, 3)
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                color: Colors.white
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.redAccent,
            child: Icon(
              Icons.delete,
            ),
            mini: true,
            tooltip: 'delete',
          ),
        ],
      ),
    );
  }
}
