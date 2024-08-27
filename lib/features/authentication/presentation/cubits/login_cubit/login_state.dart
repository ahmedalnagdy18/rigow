import 'package:equatable/equatable.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SucsessLoginState extends LoginState {}

class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
