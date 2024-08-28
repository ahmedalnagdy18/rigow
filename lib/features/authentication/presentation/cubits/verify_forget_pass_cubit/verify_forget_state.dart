import 'package:equatable/equatable.dart';

class VerifyForgetState extends Equatable {
  const VerifyForgetState();

  @override
  List<Object> get props => [];
}

final class VerifyForgetInitial extends VerifyForgetState {}

class LoadingVerifyForgetState extends VerifyForgetState {}

class SucsessVerifyForgetState extends VerifyForgetState {}

class ErrorVerifyForgetState extends VerifyForgetState {
  final String message;

  const ErrorVerifyForgetState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingEmailVerificationCodeState extends VerifyForgetState {}

class SucsessEmailVerificationCodeState extends VerifyForgetState {}

class ErrorEmailVerificationCodeState extends VerifyForgetState {
  final String message;

  const ErrorEmailVerificationCodeState({required this.message});

  @override
  List<Object> get props => [message];
}
