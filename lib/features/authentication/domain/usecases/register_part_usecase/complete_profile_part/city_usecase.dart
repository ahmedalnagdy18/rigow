import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/city_entity.dart';
import 'package:rigow/features/authentication/domain/model/city_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CityUsecase {
  final CityRepository repository;

  CityUsecase({required this.repository});

  Future<List<CityModel>> call(CityEntity cityEntity) async {
    return await repository.cities(cityEntity);
  }
}
