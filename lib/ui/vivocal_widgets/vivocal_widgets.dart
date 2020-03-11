import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/contants.dart';

class TitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20,
        top: 50,
        right: 0,
        child: Center(
          child: Text(
            Constants.welcomeLoginText,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ));
  }
}

class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 20,
        top: 80,
        right: 0,
        child: Center(
          child: Text(
            Constants.welcomeLoginText,
            style: TextStyle(fontSize: 15),
            textAlign: TextAlign.center,
          ),
        ));
  }
}


class BackgroundLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/vivocalback.jpg"),
              fit: BoxFit.cover)),
    );
  }
}
