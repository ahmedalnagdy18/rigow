import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/department_entity.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class DepartmentUsecase {
  final DepartmentRepository repository;

  DepartmentUsecase({required this.repository});

  Future<DepartmentPaginatedData<DepartmentModel>> call(
      DepartmentEntity departmentEntity) async {
    return await repository.department(departmentEntity);
  }
}
