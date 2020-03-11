import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';
import 'package:flutter_clean_architecture/ui/home/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_clean_architecture/core/contants.dart';
import 'package:flutter_clean_architecture/core/app_state.dart';
import 'package:flutter_clean_architecture/ui/login/login_bloc.dart';
import 'package:flutter_clean_architecture/core/widget_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends WidgetSate<LoginPage, LoginBloc> {
  static final SharedPreferences _preferences =
      serviceLocator<SharedPreferences>();
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          backgroundLogin(),
          welcomeText(),
          buttonPositioned(),
          loginStreamBuilder()
        ],
      ),
    );
  }

  StreamBuilder<AppState> loginStreamBuilder() {
    return StreamBuilder(
        stream: bloc.streamControllerLogin.stream,
        builder: (context, AsyncSnapshot<AppState> snapshot) {
          if (snapshot.hasData && snapshot.data is Success) {
            _preferences.setString(
                (snapshot.data as Success).data.toString(), 'token');
            return goToHome("/home");
          }
          return Container();
        });
  }

  Positioned buttonPositioned() {
    return Positioned(
      child: loginButton(),
      right: 0,
      bottom: 0,
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
        onTap: () {
          signInGoogle(googleSignIn);
        },
        child: Center(
          child: Text(
            Constants.loginContainerText,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }

  void signInGoogle(GoogleSignIn googleSignIn) {
    bloc.singInGoogle(googleSignIn);
  }

  Widget goToHome(String home) {
    return Navigator(onGenerateRoute: (RouteSettings settings) {
      switch (settings.name) {
        case '/':
          return MaterialPageRoute(builder: (context) => HomePage());
          break;
      }
      return null;
    });
  }
}
