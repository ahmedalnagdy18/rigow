import 'package:equatable/equatable.dart';

sealed class VerifyUserState extends Equatable {
  const VerifyUserState();

  @override
  List<Object> get props => [];
}

final class VerifyUserInitial extends VerifyUserState {}

class LoadingVerifyUserState extends VerifyUserState {}

class SucsessVerifyUserState extends VerifyUserState {}

class ErrorVerifyUserState extends VerifyUserState {
  final String message;

  const ErrorVerifyUserState({required this.message});

  @override
  List<Object> get props => [message];
}
