import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/faculty_input.dart';
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
