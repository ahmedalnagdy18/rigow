class VerifyForgetPasswordInput {
  final String email;
  final String verificationCode;

  VerifyForgetPasswordInput({
    required this.email,
    required this.verificationCode,
  });
}
