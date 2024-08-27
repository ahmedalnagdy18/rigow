import 'package:equatable/equatable.dart';

import '../../../domain/entities/user_data_for_complete.dart';

abstract class VerifyUserState extends Equatable {
  const VerifyUserState();

  @override
  List<Object> get props => [];
}

final class VerifyUserInitial extends VerifyUserState {}

class LoadingVerifyUserState extends VerifyUserState {}

class SucsessVerifyUserState extends VerifyUserState {
  final UserDataForComplete dataForComplete;

  SucsessVerifyUserState({required this.dataForComplete});
}

class ErrorVerifyUserState extends VerifyUserState {
  final String message;

  const ErrorVerifyUserState({required this.message});

  @override
  List<Object> get props => [message];
}
