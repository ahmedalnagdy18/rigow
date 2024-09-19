import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class FacultyUsecase {
  final CompleteProfileRepository repository;

  FacultyUsecase({required this.repository});

  Future<ToPaginatedData<FacultyModel>> call(
      FacultyEntity facultyEntity) async {
    return await repository.faculty(facultyEntity);
  }
}
