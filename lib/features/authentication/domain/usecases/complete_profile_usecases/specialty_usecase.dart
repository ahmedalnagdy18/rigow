import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/specialty_input.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class SpecialtyUsecase {
  final CompleteProfileRepository repository;

  SpecialtyUsecase({required this.repository});

  Future<PaginateddData<SpecialtyModel>> call(
      SpecialtyInput specialtyEntity) async {
    return await repository.specialty(specialtyEntity);
  }
}
