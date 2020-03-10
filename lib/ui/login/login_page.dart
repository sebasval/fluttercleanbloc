import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backgroundLogin()
        ],
      ),
    );
  }

  Container backgroundLogin() {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/vivocalback.png"),
              fit: BoxFit.fitHeight)),
    );
  }

  Widget welcomeText() {
    return Text("hola mundo",textAlign: TextAlign.center);
  }
}
