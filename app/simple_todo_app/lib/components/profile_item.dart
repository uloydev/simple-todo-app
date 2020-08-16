import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({
    Key key, this.label = '', this.value = ''
  }) : super(key: key);

  final String label, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Text(
            label,
            textAlign: TextAlign.end,
            style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 25,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          height: 100,
          child: VerticalDivider(
            color: Colors.white,
            thickness: 3,
            width: 20,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
