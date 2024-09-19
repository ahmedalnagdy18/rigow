import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/countries_input.dart';
import 'package:rigow/features/authentication/domain/model/countries_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class CountriesUsecase {
  final CompleteProfileRepository repository;

  CountriesUsecase({required this.repository});

  Future<PaginatedData<CountriesModel>> call(
      CountriesInput countriesEntity) async {
    return await repository.countries(countriesEntity);
  }
}
