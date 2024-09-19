import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/department_input.dart';
import 'package:rigow/features/authentication/domain/model/department_model.dart';

abstract class DepartmentState extends Equatable {
  @override
  List<Object> get props => [];
}

final class DepartmentInitial extends DepartmentState {}

class LoadingDepartmentState extends DepartmentState {}

class SucsessDepartmentState extends DepartmentState {
  final DepartmentPaginatedData<DepartmentModel> specialtyItems;

  SucsessDepartmentState({required this.specialtyItems});
  @override
  List<Object> get props => [specialtyItems];
}

class ErrorDepartmentState extends DepartmentState {
  final String message;

  ErrorDepartmentState({required this.message});

  @override
  List<Object> get props => [message];
}
