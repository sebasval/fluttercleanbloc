import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class Storage {

  void saveCityName(String cityName);

  List<String> getCityNames();

  Future<AppResult> saveResponseGoogleSignIn(GoogleSignInAccount googleSignInAccount);
}