import 'dart:async';

import 'package:flutter_clean_architecture/core/app_state.dart';

abstract class Bloc {
  final StreamController<AppState> streamController =
      StreamController<AppState>.broadcast();

  final StreamController<AppState> streamControllerLogin =
      StreamController<AppState>.broadcast();

  void onDispose() {
    streamController.close();
    streamControllerLogin.close();
  }
}
