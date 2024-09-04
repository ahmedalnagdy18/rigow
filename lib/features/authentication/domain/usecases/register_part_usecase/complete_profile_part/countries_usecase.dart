import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/countries_entity.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class CountriesUsecase {
  final CountriesRepository repository;

  CountriesUsecase({required this.repository});

  Future<PaginatedData<CountriesModel>> call(
      CountriesEntity countriesEntity) async {
    return await repository.countries(countriesEntity);
  }
}
