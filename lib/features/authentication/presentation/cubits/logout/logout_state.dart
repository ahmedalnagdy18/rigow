import 'package:equatable/equatable.dart';

abstract class LogoutState extends Equatable {
  const LogoutState();
  @override
  List<Object> get props => [];
}

final class LogoutInitial extends LogoutState {}

class LoadingLogoutState extends LogoutState {}

class SucsessLogoutState extends LogoutState {}

class ErrorLogoutState extends LogoutState {
  final String message;

  const ErrorLogoutState({required this.message});

  @override
  List<Object> get props => [message];
}
