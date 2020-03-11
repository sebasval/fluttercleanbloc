import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/data/mapper/remote_mappers.dart';
import 'package:flutter_clean_architecture/data/remote/remote_data_source.dart';
import 'package:flutter_clean_architecture/data/response/weather_response.dart';
import 'package:flutter_clean_architecture/data/service/remote_service.dart';
import 'package:flutter_clean_architecture/di/service_locator.dart';
import 'package:flutter_clean_architecture/domain/exceptions/app_exceptions.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AppRemoteDataSource implements RemoteDataSource {
  static final service = serviceLocator<RemoteService>();

  @override
  Future<AppResult> getWeatherByCityName(String cityName) async {
    try {
      final response = ForecastResponse.fromJson(
          await service.getWeatherByCityName(cityName));
      return AppResult.success(mapForecastResponseToWeather(response));
    } on AppException catch (error) {
      return AppResult.failure(error.message);
    } catch (e) {
      return AppResult.failure();
    }
  }

  @override
  Future<AppResult> signInGoogle(GoogleSignIn googleSignIn) async {
    try {
      final response = await googleSignIn.signIn();
      return AppResult.success(response.id);
    } on AppException catch (error) {
      return AppResult.failure(error.message);
    } catch (e) {
      return AppResult.failure();
    }
  }
}
