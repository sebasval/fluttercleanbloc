import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/contants.dart';
import 'package:flutter_clean_architecture/ui/login/login_bloc.dart';

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
          backgroundLogin(),
          welcomeText(),
          Positioned(
            child: loginButton(),
            right: 0,
            bottom: 0,
          )
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
    return Center(
        child: Text(
      Constants.welcomeLoginText,
      style: TextStyle(fontSize: 55, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ));
  }

  Widget loginButton() {
    return Container(
      height: 70,
      width: 135,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
          color: Colors.blue),
      child: GestureDetector(
        onTap: _signInGoogle,
        child: Center(
          child: Text(
            Constants.loginContainerText,
            style: TextStyle(color: Colors.white,fontSize: 20),
          ),
        ),
      ),
    );
  }

  void _signInGoogle() {
    print("hola sebas!!");
  }
}
