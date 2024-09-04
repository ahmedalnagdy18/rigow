class VerifyForgetPasswordEntity {
  final String email;
  final String verificationCode;

  VerifyForgetPasswordEntity({
    required this.email,
    required this.verificationCode,
  });

  toJson() {
    return {
      "email": email,
      "verificationCode": verificationCode,
    };
  }
}
