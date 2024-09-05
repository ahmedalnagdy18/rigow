import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/department_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/department_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/departments_cubit/department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  final DepartmentUsecase departmentUsecase;

  DepartmentCubit({required this.departmentUsecase})
      : super(DepartmentInitial());

  void getDepartments(DepartmentEntity departmentEntity) async {
    emit(LoadingDepartmentState());
    try {
      final data = await departmentUsecase.call(departmentEntity);
      emit(SucsessDepartmentState(specialtyItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorDepartmentState(message: e.message));
      }
      rethrow;
    }
    emit(DepartmentInitial());
  }
}
