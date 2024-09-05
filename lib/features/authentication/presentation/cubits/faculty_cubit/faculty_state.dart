import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/model/faculty_model.dart';

abstract class FacultyState extends Equatable {
  @override
  List<Object> get props => [];
}

final class FacultyInitial extends FacultyState {}

class LoadingFacultyState extends FacultyState {}

class SucsessFacultyState extends FacultyState {
  final ToPaginatedData<FacultyModel> specialtyItems;

  SucsessFacultyState({required this.specialtyItems});
  @override
  List<Object> get props => [specialtyItems];
}

class ErrorFacultyState extends FacultyState {
  final String message;

  ErrorFacultyState({required this.message});

  @override
  List<Object> get props => [message];
}
