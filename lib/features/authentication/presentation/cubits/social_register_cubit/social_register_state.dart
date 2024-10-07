import 'package:equatable/equatable.dart';

abstract class SocialRegisterState extends Equatable {
  const SocialRegisterState();
  @override
  List<Object> get props => [];
}

final class SocialRegisterInitial extends SocialRegisterState {}

class LoadingSocialRegisterState extends SocialRegisterState {}

class SucsessSocialRegisterState extends SocialRegisterState {}

class ErrorSocialRegisterState extends SocialRegisterState {
  final String message;

  const ErrorSocialRegisterState({required this.message});

  @override
  List<Object> get props => [message];
}
