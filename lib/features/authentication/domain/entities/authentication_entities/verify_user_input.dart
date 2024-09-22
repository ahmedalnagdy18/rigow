class VerifyUserInput {
  final String email;
  final String verificationCode;
  final String useCase;

  VerifyUserInput({
    required this.useCase,
    required this.email,
    required this.verificationCode,
  });
}
