import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';

abstract class CheckSocialLoginState extends Equatable {
  const CheckSocialLoginState();
  @override
  List<Object> get props => [];
}

final class CheckSocialInitial extends CheckSocialLoginState {}

class LoadingCheckSocialState extends CheckSocialLoginState {}

class SucsessCheckSocialState extends CheckSocialLoginState {
  final UserDataEntity myData;

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
