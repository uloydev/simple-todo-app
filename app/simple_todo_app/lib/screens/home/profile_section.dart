import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_todo_app/components/home_layout.dart';
import 'package:simple_todo_app/components/profile_item.dart';

class ProfileSection extends StatefulWidget {
  @override
  _ProfileSectionState createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  @override
  Widget build(BuildContext context) {
    const String profileImage = 'assets/images/profile.svg';

    return HomeLayout(
      title: 'Profile',
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey[400],
              blurRadius: 10,
              spreadRadius: 2
            ),
          ],
        ),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(height: 20),
                  SvgPicture.asset(
                    profileImage,
                    height: 100,
                    color: Colors.white,
                  ),
                  SizedBox(height: 50),
                  ProfileItem(
                    label: 'Name',
                    value: 'UloyDev',
                  ),
                  ProfileItem(
                    label: 'Email',
                    value: 'admin@uloy.dev',
                  ),
                  ProfileItem(
                    label: 'Joined At',
                    value: '12-04-2020',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
