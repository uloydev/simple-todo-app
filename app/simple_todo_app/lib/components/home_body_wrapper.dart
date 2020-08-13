import 'package:flutter/material.dart';

class HomeBodyWrapper extends StatelessWidget {
  const HomeBodyWrapper({
    Key key, this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(75, 50)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, -10),
              blurRadius: 10)
        ],
      ),
      child: child,
    );
  }
}
