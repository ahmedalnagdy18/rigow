import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/specialty_entity.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class SpecialtyUsecase {
  final CompleteProfileRepository repository;

  SpecialtyUsecase({required this.repository});

  Future<PaginateddData<SpecialtyModel>> call(
      SpecialtyEntity specialtyEntity) async {
    return await repository.specialty(specialtyEntity);
  }
}
