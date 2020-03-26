import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/app_state.dart';
import 'package:flutter_clean_architecture/core/contants.dart';
import 'package:flutter_clean_architecture/core/widget_state.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/ui/vivocal_widgets/vivocal_widgets.dart';
import 'package:flutter_clean_architecture/ui/home/home_bloc.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends WidgetSate<HomePage, HomeBloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(Constants.primaryColor).withOpacity(1.0)),
      body: Column(
        children: <Widget>[
          exploreText(),
          SizedBox(height: 10),
          ArtistType()
        ],
      ),
    );
  }

  Widget exploreText() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 200, 0),
      child: VivoText(Constants.explore, 25.0, Constants.josefinSans, 1.0),
    );
  }
}
