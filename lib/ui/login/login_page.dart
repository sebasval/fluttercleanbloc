import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/ui/home/home_page.dart';
import 'package:flutter_clean_architecture/ui/vivocal_widgets/vivocal_widgets.dart';
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
  GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(Constants.primaryColor).withOpacity(0.5),
      body: Column(
        children: <Widget>[
          SizedBox(height: 200),
          LoginTitleText(),
          SizedBox(height: 50),
          LoginDescriptionText(),
          SizedBox(height: 50),
          loginButton()
        ],
      ),
    );
  }

  StreamBuilder<AppState> loginStreamBuilder() {
    return StreamBuilder(
        stream: bloc.streamControllerLogin.stream,
        builder: (context, AsyncSnapshot<AppState> snapshot) {
          if (snapshot.hasData && snapshot.data is Success) {
            return goToHome("/home");
          }
          return Container();
        });
  }

  Widget loginButton() {
    return MaterialButton(
      color: Colors.white,
      elevation: 2.0,
      onPressed: () {
        _signInGoogle(googleSignIn);
      },
      shape: StadiumBorder(),
      child: Row(
        children: <Widget>[
          Container(
              color: Color(Constants.white),
              width: 30,
              height: 30,
              child: Image.asset('assets/images/google_icon.jpg')),
          SizedBox(width: 10),
          VivoText(Constants.signIn, Constants.thirdColor, 20, 'Quicksand')
        ],
      ),
    );
  }

  void _signInGoogle(GoogleSignIn googleSignIn) {
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
