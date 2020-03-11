import 'package:flutter_clean_architecture/core/app_result.dart';
import 'package:flutter_clean_architecture/domain/use_case/vivocal_use_case.dart';
import 'package:flutter_clean_architecture/domain/use_case/save_vivocal_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../util/test_stubs.dart';

void main() {
  final MockAppRepository repository = MockAppRepository();
  final SaveCityNameUseCase saveCityNameUseCase = SaveCityName(repository);
  final GetVivocalUseCase useCase =
      GetVivocalUseCaseImpl(repository, saveCityNameUseCase);

  final String cityName = "London";

  test('execute should return weather forecast', () async {
    when(repository.getWeatherByCityName(any))
        .thenAnswer((_) async => AppResult.success());

    final response = await useCase.execute(cityName);

    expect(Status.SUCCESS, response.status);
    verify(saveCityNameUseCase.execute(cityName));
    verify(repository.getWeatherByCityName(cityName));
  });

  test('execute should return failure', () async {
    final message = 'we got an error';
    when(repository.getWeatherByCityName(any))
        .thenAnswer((_) async => AppResult.failure(message));

    final response = await useCase.execute(cityName);

    expect(Status.FAILURE, response.status);
    expect(message, response.message);
  });
}
