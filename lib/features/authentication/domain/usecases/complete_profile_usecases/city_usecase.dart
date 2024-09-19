import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/city_input.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class CityUsecase {
  final CompleteProfileRepository repository;

  CityUsecase({required this.repository});

  Future<List<CityModel>> call(CityInput cityEntity) async {
    return await repository.cities(cityEntity);
  }
}
