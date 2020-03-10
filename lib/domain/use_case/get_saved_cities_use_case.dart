import 'package:flutter_clean_architecture/domain/repository/repository.dart';

abstract class SaveVivocalUseCase {
  List<String> execute();
}

class GetSavesCities implements SaveVivocalUseCase {
  final Repository repository;

  GetSavesCities(this.repository);

  @override
  List<String> execute() => repository.getCityNames();
}
