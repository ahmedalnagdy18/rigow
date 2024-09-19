import 'package:equatable/equatable.dart';

import '../../../domain/entities/complete_profile_entities/user_data_for_complete.dart';

abstract class VerifyUserState extends Equatable {
  const VerifyUserState();

  @override
  List<Object> get props => [];
}

final class VerifyUserInitial extends VerifyUserState {}

class LoadingVerifyUserState extends VerifyUserState {}

class SucsessVerifyUserState extends VerifyUserState {
  final UserDataForComplete dataForComplete;

  const SucsessVerifyUserState({required this.dataForComplete});
}

class ErrorVerifyUserState extends VerifyUserState {
  final String message;

  const ErrorVerifyUserState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingEmailVerificationCodeState extends VerifyUserState {}

class SucsessEmailVerificationCodeState extends VerifyUserState {}

class ErrorEmailVerificationCodeState extends VerifyUserState {
  final String message;

  const ErrorEmailVerificationCodeState({required this.message});

  @override
  List<Object> get props => [message];
}
