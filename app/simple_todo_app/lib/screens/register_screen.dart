import 'package:flutter/material.dart';
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
              child: Column(children: [
                SizedBox(
                  height: screenSize.height * 0.15,
                ),
                Center(
                  child: Text(
                    'Register',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: screenSize.height * 0.2),
                CustomInput(
                  label: 'Email',
                  obsecure: false,
                  icon: Icon(
                    Icons.email,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                SizedBox(height: 25),
                CustomInput(
                  label: 'Password',
                  obsecure: true,
                  icon: Icon(
                    Icons.vpn_key,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
                SizedBox(height: 50),
                SizedBox(
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
                SizedBox(height: 30),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Already have account ? ",
                    style: TextStyle(fontSize: 15),
                  ),
                  GestureDetector(
                    child: Text(
                      "Login Now",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 15),
                    ),
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                  )
                ])
              ]),
            )
          ],
        ));
  }
}
