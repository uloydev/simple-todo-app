import 'package:flutter/material.dart';
import 'package:simple_todo_app/animations/fade_animation.dart';
import 'package:simple_todo_app/components/auth_background.dart';
import 'package:simple_todo_app/components/custom_input.dart';
import 'package:simple_todo_app/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            AuthBackground(),
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: ListView(children: [
                SizedBox(
                  height: screenSize.height * 0.1,
                ),
                FadeAnimation(
                  delay: 300,
                  child: Center(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.175),
                FadeAnimation(
                  delay: 500,
                  child: CustomInput(
                    label: 'Name',
                    obsecure: false,
                    icon: Icon(
                      Icons.people,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                FadeAnimation(
                  delay: 600,
                  child: CustomInput(
                    label: 'Email',
                    obsecure: false,
                    icon: Icon(
                      Icons.email,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                FadeAnimation(
                  delay: 700,
                  child: CustomInput(
                    label: 'Password',
                    obsecure: true,
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(height: 25),
                FadeAnimation(
                  delay: 800,
                  child: CustomInput(
                    label: 'Confirm Password',
                    obsecure: true,
                    icon: Icon(
                      Icons.vpn_key,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ),
                SizedBox(height: 50),
                FadeAnimation(
                  delay: 1000,
                  child: SizedBox(
                    width: screenSize.width,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Colors.blueAccent,
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 25),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
                SizedBox(height: 30),
                FadeAnimation(
                  delay: 1000,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have account ? ",
                          style: TextStyle(fontSize: 15),
                        ),
                        GestureDetector(
                          child: Text(
                            "Login Now",
                            style: TextStyle(
                                color: Colors.blueAccent, fontSize: 15),
                          ),
                          onTap: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                        )
                      ]),
                )
              ]),
            )
          ],
        ));
  }
}
