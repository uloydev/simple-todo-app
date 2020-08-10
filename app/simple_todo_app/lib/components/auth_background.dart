import 'package:flutter/material.dart';



class AuthBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Stack(children: [
              Container(
                color: Colors.blueAccent,
                width: screenSize.width / 2,
              ),
              Column(
                children: [
                  Container(
                    height: screenSize.height * 0.30,
                    decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.elliptical(100, 50))),
                  ),
                  Container(
                    height: screenSize.height * 0.70,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.elliptical(150, 75))),
                  )
                ],
              ),
            ]);
  }
}