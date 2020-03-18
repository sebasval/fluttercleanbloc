import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/contants.dart';

class VivoText extends StatelessWidget {
  final String _text;
  final int _color;
  final double _size;
  final String _fontStyle;

  VivoText(this._text, this._color, this._size,this._fontStyle);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      style: TextStyle(fontSize: _size, color: Color(_color).withOpacity(0.7),fontFamily: _fontStyle),
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
            style: TextStyle(fontSize: 20, color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ));
  }
}

class BackgroundLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      decoration: BoxDecoration(
        color: Color(Constants.thirdColor)),
    );
  }
}

class ShowErrorDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Error al iniciar sesión"),
      content: Container(),
      actions: <Widget>[okButton(context)],
    );
  }

  FlatButton okButton(BuildContext context) {
    return FlatButton(
        onPressed: () {
          Navigator.of(context, rootNavigator: true).pop();
        },
        child: Text("ok"));
  }
}

class VivoContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 430,
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(55), topRight: Radius.circular(55)),
            color: Colors.white),
      ),
    );
  }
}


class LoginTitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: VivoText(Constants.vivocal, Constants.white, 50.0,'ChunkFive'));
  }
}

class LoginDescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(child: VivoText(Constants.welcomeLoginText, Constants.thirdColor, 20.0,'Quicksand'));
  }
}

