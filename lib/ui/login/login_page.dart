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
  GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(Constants.vivoBack),
                        fit: BoxFit.cover))),
          ),
          LoginTitleText(),
          LoginDescriptionText(),
          loginButton(),
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
            return goToHome();
          }
          return Container();
        });
  }

  Widget loginButton() {
    return Positioned(
      right: 0,
      bottom: 0,
      child: Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(45)),
            color: Colors.blue),
        child: GestureDetector(
          onTap: () {
            _signInGoogle(googleSignIn);
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: VivoText(Constants.signIn, Constants.white, 20,
                  Constants.chunkFive, 1.0),
            ),
          ),
        ),
      ),
    );
  }

  void _signInGoogle(GoogleSignIn googleSignIn) {
    bloc.singInGoogle(googleSignIn);
  }

  Widget goToHome() {
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
