import 'package:equatable/equatable.dart';

abstract class CompleteExpertState extends Equatable {
  const CompleteExpertState();
  @override
  List<Object> get props => [];
}

final class CompleteExpertInitial extends CompleteExpertState {}

class LoadingCompleteExpertState extends CompleteExpertState {}

class SucsessCompleteExpertState extends CompleteExpertState {}

class ErrorCompleteExpertState extends CompleteExpertState {
  final String message;

  const ErrorCompleteExpertState({required this.message});

  @override
  List<Object> get props => [message];
}
