import 'package:equatable/equatable.dart';

sealed class MainCompleteProfileState extends Equatable {
  const MainCompleteProfileState();

  @override
  List<Object> get props => [];
}

final class MainCompleteInitial extends MainCompleteProfileState {}

class LoadingCompleteProfileUserState extends MainCompleteProfileState {}

class SucsessCompleteProfileUserState extends MainCompleteProfileState {
  final String uploadedProfileImage;

  const SucsessCompleteProfileUserState({required this.uploadedProfileImage});
}

class ErrorCompleteProfileUserState extends MainCompleteProfileState {
  final String message;

  const ErrorCompleteProfileUserState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingUploadFileState extends MainCompleteProfileState {}

class SucsessUploadFileState extends MainCompleteProfileState {}

class ErrorUploadFileState extends MainCompleteProfileState {
  final String message;

  const ErrorUploadFileState({required this.message});

  @override
  List<Object> get props => [message];
}
