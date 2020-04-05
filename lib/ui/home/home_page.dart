import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/app_state.dart';
import 'package:flutter_clean_architecture/core/contants.dart';
import 'package:flutter_clean_architecture/core/widget_state.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';
import 'package:flutter_clean_architecture/domain/model/weather.dart';
import 'package:flutter_clean_architecture/ui/vivocal_widgets/vivocal_widgets.dart';
import 'package:flutter_clean_architecture/ui/home/home_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends WidgetSate<HomePage, HomeBloc> {
  int _page = 0;

  static final SharedPreferences _preferences =
      serviceLocator<SharedPreferences>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: homeScreen(),
        bottomNavigationBar: bottomNavigation());
  }

  Widget appBar() {
    switch (_page) {
      case 0:
        return AppBar(backgroundColor: Colors.blue);
        break;
      case 1:
        return null;
        break;
      case 2:
        return null;
        break;
      default:
        return AppBar(backgroundColor: Colors.blue);
        break;
    }
  }

  Widget homeScreen() {
    switch (_page) {
      case 0:
        return exploreScreen();
        break;
      case 1:
        return artistScreen();
        break;
      case 2:
        return profileScreen(
            _preferences.getString(Constants.photoAccount),
            _preferences.getString(Constants.nameAccount),
            _preferences.getString(Constants.emailAccount));
        break;
      default:
        return exploreScreen();
        break;
    }
  }

  Widget artistScreen() => Center(child: Text("Hola mundo"));

  Widget exploreScreen() {
    return Column(
      children: <Widget>[exploreText(), SizedBox(height: 10), ArtistType()],
    );
  }

  Widget profileScreen(String photoUrl, String name, String email) {
    return Stack(
      children: <Widget>[
        VivoBackContainer(),
        ProfileImage(photoUrl),
        ProfileName(name),
        ProfileId(email)
      ],
    );
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
