import 'package:google_sign_in/google_sign_in.dart';

abstract class RemoteService {
  Future<dynamic> getWeatherByCityName(String cityName);
}