import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/contants.dart';

class VivoText extends StatelessWidget {
  final String _text;
  final double _size;
  final String _fontStyle;
  final double _opacity;
  final Color _color;

  VivoText(this._text, this._size, this._fontStyle, this._opacity,
      [this._color = Colors.black]);

  @override
  Widget build(BuildContext context) {
    return Text(
      _text,
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: _size,
          color: _color.withOpacity(_opacity),
          fontFamily: _fontStyle),
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
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Color(Constants.thirdColor)),
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
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
    return Positioned(
        top: 40,
        left: 110,
        child:
            VivoText(Constants.vivocal, 50.0, Constants.chunkFive, 1.0, Color(Constants.primaryColor)));
  }
}

class LoginDescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 300,
        left: 150,
        child: VivoText(
            Constants.welcomeLoginText, 20.0, Constants.chunkFive,1.0, Color(Constants.primaryColor)));
  }
}

class ArtistType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[

      ],
    )
  }
}



