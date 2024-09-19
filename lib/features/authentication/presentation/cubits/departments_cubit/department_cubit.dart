import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/department_input.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/department_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/departments_cubit/department_state.dart';

class DepartmentCubit extends Cubit<DepartmentState> {
  final DepartmentUsecase departmentUsecase;

  DepartmentCubit({required this.departmentUsecase})
      : super(DepartmentInitial());

  void getDepartments(DepartmentInput departmentEntity) async {
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
