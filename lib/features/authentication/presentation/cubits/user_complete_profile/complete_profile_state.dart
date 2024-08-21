import 'package:equatable/equatable.dart';

sealed class CompleteProfileState extends Equatable {
  const CompleteProfileState();

  @override
  List<Object> get props => [];
}

final class CompleteInitial extends CompleteProfileState {}

class LoadingValidateUsernameState extends CompleteProfileState {}

class SucsessValidateUsernameState extends CompleteProfileState {}

class ErrorValidateUsernameState extends CompleteProfileState {
  final String message;

  const ErrorValidateUsernameState({required this.message});

  @override
  List<Object> get props => [message];
}
