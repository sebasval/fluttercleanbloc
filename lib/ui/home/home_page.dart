import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(backgroundColor: Colors.blue),
        body: homeScreen(),
        bottomNavigationBar: bottomNavigation());
  }

  Widget homeScreen() {
    switch (_page) {
      case 0:
        return Column(
          children: <Widget>[exploreText(), SizedBox(height: 10), ArtistType()],
        );
        break;
      case 1:
        return Center(child: Text("Hola mundo"));
        break;
      case 2:
        return Text("Hola mundo 2");
        break;
      default:
        return Column(
          children: <Widget>[exploreText(), SizedBox(height: 10), ArtistType()],
        );
        break;
    }
  }

  CurvedNavigationBar bottomNavigation() {
    return CurvedNavigationBar(
      backgroundColor: Color(Constants.primaryColor).withOpacity(1.0),
      items: <Widget>[
        Icon(Icons.search, size: 30, color: Colors.blue),
        Icon(Icons.list, size: 30, color: Colors.blue),
        Icon(Icons.account_circle, size: 30, color: Colors.blue),
      ],
      onTap: (index) {
        setState(() {
          _page = index;
        });
      },
    );
  }

  Widget exploreText() {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 15, 200, 0),
      child: VivoText(Constants.explore, 25.0, Constants.josefinSans, 1.0),
    );
  }
}
