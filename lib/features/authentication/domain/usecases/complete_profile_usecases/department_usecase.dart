import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/department_input.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';

class DepartmentUsecase {
  final CompleteProfileRepository repository;

  DepartmentUsecase({required this.repository});

  Future<DepartmentPaginatedData<DepartmentModel>> call(
      DepartmentInput departmentEntity) async {
    return await repository.department(departmentEntity);
  }
}
