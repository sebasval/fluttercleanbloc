import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class Repository {

  Future<AppResult> getWeatherByCityName(String cityName);
  Future<AppResult> signInGoogle(GoogleSignIn googleSignIn);
  Future<AppResult> saveResponseGoogleSignIn(GoogleSignInAccount googleSignInAccount);


  void saveCityName(String cityName);

  List<String> getCityNames();
}