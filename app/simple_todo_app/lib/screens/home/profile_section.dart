import 'package:flutter/material.dart';
import 'package:simple_todo_app/components/home_layout.dart';

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      title: 'Profile',
      child: Center(
        child: Text('profile Section'),
      ),
    );
  }
}
