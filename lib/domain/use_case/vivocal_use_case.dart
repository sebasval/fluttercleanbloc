import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_vivocal_use_case.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GetVivocalUseCase {
  Future<AppResult> execute(String cityName);
  Future<AppResult> signInGoogle(GoogleSignIn googleSignIn);
}

class GetWeatherByCityName implements GetVivocalUseCase {

  final Repository repository;
  final SaveCityNameUseCase saveCityNameUseCase;

  GetWeatherByCityName(this.repository, this.saveCityNameUseCase);

  @override
  Future<AppResult> execute(String cityName) async {
    final response = await repository.getWeatherByCityName(cityName);
    switch (response.status) {
      case Status.SUCCESS:
        saveCityNameUseCase.execute(cityName);
        return AppResult.success(response.data);
        break;
      default:
        return AppResult.failure(response.message);
    }
  }

  @override
  Future<AppResult> signInGoogle(GoogleSignIn googleSignIn) async{
    final response = await repository.signInGoogle(googleSignIn);
    switch (response.status) {
      case Status.SUCCESS:
        return AppResult.success(response.data);
        break;
      default:
        return AppResult.failure(response.message);
    }
  }


}