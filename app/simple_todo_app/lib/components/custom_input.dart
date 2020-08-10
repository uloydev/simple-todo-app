import 'package:flutter/material.dart';

class CustomInput extends StatelessWidget {

  const CustomInput({
    Key key,
    this.label,
    this.icon,
    this.obsecure = false,
  }) : super(key: key);

  final String label;
  final Icon icon;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10),
      color: Colors.lightBlue,
      elevation: 10,
      child: Container(
          padding:
              EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: TextField(
              obscureText: this.obsecure,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
              decoration: InputDecoration(
                  prefixIcon: this.icon,
                  hintText: this.label,
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w700,
                      fontSize: 20)))),
    );
  }
}
