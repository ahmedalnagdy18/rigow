import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/all_user_data.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

class LoadingLoginState extends LoginState {}

class SucsessLoginState extends LoginState {
  final AllUserData data;

  const SucsessLoginState({required this.data});
}

class ErrorLoginState extends LoginState {
  final String message;

  const ErrorLoginState({required this.message});

  @override
  List<Object> get props => [message];
}
