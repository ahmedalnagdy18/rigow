import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/specialty_input.dart';
import 'package:rigow/features/authentication/domain/model/specialty_model.dart';

abstract class SpecialtyState extends Equatable {
  @override
  List<Object> get props => [];
}

final class SpecialtyInitial extends SpecialtyState {}

class LoadingSpecialtyState extends SpecialtyState {}

class SucsessSpecialtyState extends SpecialtyState {
  final PaginateddData<SpecialtyModel> specialtyItems;

  SucsessSpecialtyState({required this.specialtyItems});
  @override
  List<Object> get props => [specialtyItems];
}

class ErrorSpecialtyState extends SpecialtyState {
  final String message;

  ErrorSpecialtyState({required this.message});

  @override
  List<Object> get props => [message];
}
