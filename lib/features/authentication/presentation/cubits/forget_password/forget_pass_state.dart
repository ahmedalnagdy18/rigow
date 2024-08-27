import 'package:equatable/equatable.dart';

sealed class ForgetPassState extends Equatable {
  const ForgetPassState();

  @override
  List<Object> get props => [];
}

final class ForgetPassInitial extends ForgetPassState {}

class LoadingForgetPass extends ForgetPassState {}

class SucsessForgetPass extends ForgetPassState {}

class ErrorForgetPass extends ForgetPassState {
  final String message;

  const ErrorForgetPass({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingEmailVerificationCodeState extends ForgetPassState {}

class SucsessEmailVerificationCodeState extends ForgetPassState {}

class ErrorEmailVerificationCodeState extends ForgetPassState {
  final String message;

  const ErrorEmailVerificationCodeState({required this.message});

  @override
  List<Object> get props => [message];
}
