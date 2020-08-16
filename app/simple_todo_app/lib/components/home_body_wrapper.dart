import 'package:flutter/material.dart';

class HomeBodyWrapper extends StatelessWidget {
  const HomeBodyWrapper({
    Key key,
    this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(35, 35)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.1),
              offset: Offset(0, -10),
              blurRadius: 5)
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.elliptical(35, 35)),
        child: child,
      ),
    );
  }
}
