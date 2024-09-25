import 'package:equatable/equatable.dart';

abstract class CompleteExpertState extends Equatable {
  const CompleteExpertState();
  @override
  List<Object> get props => [];
}

final class CompleteExpertInitial extends CompleteExpertState {}

class LoadingCompleteExpertState extends CompleteExpertState {}

class SucsessCompleteExpertState extends CompleteExpertState {
  final String uploadedProfileImage;

  const SucsessCompleteExpertState({
    required this.uploadedProfileImage,
  });
}

class ErrorCompleteExpertState extends CompleteExpertState {
  final String message;

  const ErrorCompleteExpertState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoadingUploadFileState extends CompleteExpertState {}

class SucsessUploadFileState extends CompleteExpertState {}

class ErrorUploadFileState extends CompleteExpertState {
  final String message;

  const ErrorUploadFileState({required this.message});

  @override
  List<Object> get props => [message];
}
