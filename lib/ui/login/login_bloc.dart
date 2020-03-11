import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/core/app_state.dart';
import 'package:flutter_clean_architecture/core/bloc.dart';
import 'package:flutter_clean_architecture/domain/use_case/vivocal_use_case.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class LoginState extends AppState {}

class LoginBloc extends Bloc {
  final GetVivocalUseCase _getVivocalUseCase;

  LoginBloc(this._getVivocalUseCase);

  void singInGoogle(GoogleSignIn googleSignIn) async {
    final response = await _getVivocalUseCase.signInGoogle(googleSignIn);
    switch (response.status) {
      case Status.SUCCESS:
        final result =
            await _getVivocalUseCase.saveResponseGoogleSignIn(response.data);
        switch (result.status) {
          case Status.SUCCESS:
            streamControllerLogin.sink.add(Success(response.data));
            break;
          case Status.FAILURE:
            streamControllerLogin.sink.add(Failure(response.data));
            break;
        }
        break;
      case Status.FAILURE:
        streamControllerLogin.sink.add(Failure(response.message));
        break;
    }
  }
}
