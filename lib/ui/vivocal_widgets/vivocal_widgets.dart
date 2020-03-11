import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/contants.dart';

class TitleLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 120,
      top: 200,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            Constants.vivo,
            style: TextStyle(fontSize: 50, color: Colors.white),
          ),
          Text(
            Constants.cal,
            style: TextStyle(fontSize: 50,color: Color(Constants.thirdColor).withOpacity(0.7)),
          ),
        ],
      ),
    );
  }
}

class DescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 300,
        left: 50,
        child: Center(
          child: Text(
            Constants.welcomeLoginText,
            style: TextStyle(fontSize: 20,color: Colors.black),
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
