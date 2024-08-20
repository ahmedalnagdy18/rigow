class VerifyUserEntity {
  final String email;
  final String verificationCode;

  VerifyUserEntity({
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
