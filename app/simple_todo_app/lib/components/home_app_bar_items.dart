import 'package:flutter/material.dart';

class HomeAppBarItems extends StatelessWidget {
  const HomeAppBarItems({
    Key key, this.title
  }) : super(key: key);

final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'about and credit',
            child: Icon(
              Icons.info,
              size: 30,
            ),
            elevation: 0,
            highlightElevation: 0,
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 40,
            ),
          ),
          FloatingActionButton(
            onPressed: () {},
            tooltip: 'logout',
            child: Icon(
              Icons.exit_to_app,
              size: 30,
            ),
            elevation: 0,
            highlightElevation: 0,
          ),
        ],
      ),
    );
  }
}
