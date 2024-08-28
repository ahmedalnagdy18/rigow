import 'package:equatable/equatable.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

class LoadingResetPasswordState extends ResetPasswordState {}

class LoadedResetPasswordState extends ResetPasswordState {}

class SucsessResetPasswordtate extends ResetPasswordState {}

class ErrorResetPasswordState extends ResetPasswordState {
  final String message;

  const ErrorResetPasswordState({required this.message});

  @override
  List<Object> get props => [message];
}
