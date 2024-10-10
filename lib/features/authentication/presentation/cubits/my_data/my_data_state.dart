import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';

abstract class MyDataState extends Equatable {
  const MyDataState();
  @override
  List<Object> get props => [];
}

final class MyDataInitial extends MyDataState {}

class LoadingMyDataState extends MyDataState {}

class SucsessMyDataState extends MyDataState {
  final UserDataEntity myData;

  const SucsessMyDataState({required this.myData});
}

class ErrorMyDataState extends MyDataState {
  final String message;

  const ErrorMyDataState({required this.message});

  @override
  List<Object> get props => [message];
}
