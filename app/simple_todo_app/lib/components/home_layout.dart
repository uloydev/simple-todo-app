import 'package:flutter/material.dart';
import 'home_app_bar_items.dart';
import 'home_body_wrapper.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({
    Key key, this.title, this.child,
  }) : super(key: key);

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: HomeAppBarItems(
          title: title,
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.blueAccent,
      body: HomeBodyWrapper(
        child: child
      ),
    );
  }
}
