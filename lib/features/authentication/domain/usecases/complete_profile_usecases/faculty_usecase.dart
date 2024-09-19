import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/faculty_input.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class FacultyUsecase {
  final CompleteProfileRepository repository;

  FacultyUsecase({required this.repository});

  Future<ToPaginatedData<FacultyModel>> call(FacultyInput facultyEntity) async {
    return await repository.faculty(facultyEntity);
  }
}
