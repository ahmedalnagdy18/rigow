class SendEmailVerificationCodeInput {
  final String email;
  final String useCase;

  SendEmailVerificationCodeInput({required this.email, required this.useCase});

  toJson() {
    return {
      "email": email,
      "useCase": useCase,
    };
  }
}
