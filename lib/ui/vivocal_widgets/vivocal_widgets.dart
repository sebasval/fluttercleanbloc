import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/constants.dart';

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
      overflow: TextOverflow.fade,
      maxLines: 3,
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

class VivoBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Constants.vivoBack), fit: BoxFit.cover))),
    );
  }
}

class LoginTitleText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 200,
        left: 110,
        child: VivoText(
            Constants.vivocal, 50.0, Constants.chunkFive, 1.0, Colors.blue));
  }
}

class LoginDescriptionText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 300,
        left: 150,
        child: VivoText(Constants.welcomeLoginText, 20.0, Constants.chunkFive,
            1.0, Colors.blue));
  }
}

class ViVoCard extends StatelessWidget {
  final String _description;
  static String _image;

  ViVoCard(this._description, String _image) {
    ViVoCard._image = _image;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 165,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 2.0, color: Colors.grey)]),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 5.0, right: 5.0),
            child: Image.asset(_image),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(top: 6, bottom: 5),
            child: VivoText(_description, 20.0, Constants.josefinSans, 1.0),
          )
        ],
      ),
    );
  }
}

class ArtistType extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 172,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          SizedBox(
            width: 20,
          ),
          ViVoCard(Constants.singer, 'assets/images/singer.jpg'),
          SizedBox(
            width: 20,
          ),
          ViVoCard(Constants.singer, 'assets/images/singer.jpg'),
          SizedBox(
            width: 20,
          ),
          ViVoCard(Constants.singer, 'assets/images/singer.jpg'),
        ],
      ),
    );
  }
}

class VivoBackContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35))),
        ),
        left: 0,
        top: 0);
  }
}

class ProfileImage extends StatelessWidget {
  final String _photoUrl;

  ProfileImage(this._photoUrl);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: 20,
      child: Container(
        width: 100,
        height: 100,
        child: ClipOval(
          child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif', image: _photoUrl),
        ),
      ),
    );
  }
}

class ProfileName extends StatelessWidget {
  final String _name;

  ProfileName(this._name);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: VivoText(_name, 20, Constants.chunkFive, 1.0, Colors.white),
        left: 140,
        top: 120);
  }
}

class ProfileId extends StatelessWidget {
  final String _id;

  ProfileId(this._id);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        child: VivoText(_id, 20, Constants.quickSand, 1.0, Colors.white),
        left: 140,
        top: 150);
  }
}
