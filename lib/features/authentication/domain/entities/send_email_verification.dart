class SendEmailVerificationCodeEntity {
  final String email;
  final String useCase;

  SendEmailVerificationCodeEntity({required this.email, required this.useCase});

  toJson() {
    return {
      "email": email,
      "useCase": useCase,
    };
  }
}
