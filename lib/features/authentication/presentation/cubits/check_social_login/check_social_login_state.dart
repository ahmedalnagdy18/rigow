import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/model/check_provider_model.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';
import 'package:rigow/features/authentication/domain/model/social_merge_model.dart';

abstract class CheckSocialLoginState extends Equatable {
  const CheckSocialLoginState();
  @override
  List<Object> get props => [];
}

final class CheckSocialInitial extends CheckSocialLoginState {}

class LoadingCheckSocialState extends CheckSocialLoginState {}

class SucsessCheckSocialState extends CheckSocialLoginState {
  final CheckProviderModel myData;

  const SucsessCheckSocialState({required this.myData});
}

class ErrorCheckSocialState extends CheckSocialLoginState {
  final String message;

  const ErrorCheckSocialState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingSocialLoginState extends CheckSocialLoginState {}

class SucsessSocialLoginState extends CheckSocialLoginState {
  final SocialLoginModel myData;

  const SucsessSocialLoginState({required this.myData});
}

class ErrorSocialLoginState extends CheckSocialLoginState {
  final String message;

  const ErrorSocialLoginState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingSocialMergeState extends CheckSocialLoginState {}

class SucsessSocialMergeState extends CheckSocialLoginState {
  final SocialMergeModel myData;

  const SucsessSocialMergeState({required this.myData});
}

class ErrorSocialMergeState extends CheckSocialLoginState {
  final String message;

  const ErrorSocialMergeState({required this.message});

  @override
  List<Object> get props => [message];
}
