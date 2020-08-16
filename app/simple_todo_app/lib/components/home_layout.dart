import 'package:flutter/material.dart';
import 'home_app_bar_items.dart';
import 'home_body_wrapper.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({
    Key key,
    this.title,
    this.isMain = false,
    this.child,
  }) : super(key: key);

  final String title;
  final Widget child;
  final bool isMain;
  
  List<Widget> appbarActions = [];

  @override
  Widget build(BuildContext context) {
    if (isMain) {
      appbarActions.add(IconButton(
              tooltip: 'Add new Todo',
              icon: Icon(Icons.add),
              iconSize: 30,
              onPressed: () {},
            ));
    }
    appbarActions.addAll([
            IconButton(
              tooltip: 'about',
              icon: Icon(Icons.info),
              iconSize: 30,
              onPressed: () {},
            ),
            IconButton(
              tooltip: 'sign out',
              icon: Icon(Icons.exit_to_app),
              iconSize: 30,
              onPressed: () {},
            ),
          ]);

    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 100,
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 30,
            ),
          ),
          actions: appbarActions,
          elevation: 0,
        ),
        backgroundColor: Colors.blueAccent,
        body: HomeBodyWrapper(child: child),
      ),
    );
  }
}
