class VerifyUserEntity {
  final String email;
  final String verificationCode;
  final String useCase;

  VerifyUserEntity({
    required this.useCase,
    required this.email,
    required this.verificationCode,
  });

  toJson() {
    return {
      "email": email,
      "verificationCode": verificationCode,
      "useCase": useCase.toUpperCase(),
    };
  }
}