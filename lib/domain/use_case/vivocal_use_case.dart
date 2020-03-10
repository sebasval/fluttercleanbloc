import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/domain/repository/repository.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_vivocal_use_case.dart';

abstract class GetVivocalUseCase {
  Future<AppResult> execute(String cityName);
  Future<AppResult> signInGoogle();
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
  Future<AppResult> signInGoogle() async{
    final response = await repository.signInGoogle();
    switch (response.status) {
      case Status.SUCCESS:
        return AppResult.success(response.data);
        break;
      default:
        return AppResult.failure(response.message);
    }
  }


}