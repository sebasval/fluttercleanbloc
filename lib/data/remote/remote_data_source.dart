import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteDataSource {
  Future<AppResult> getWeatherByCityName(String cityName);
  Future<AppResult> signInGoogle(GoogleSignIn googleSignIn);
}