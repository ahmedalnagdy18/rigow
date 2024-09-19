class ForgetPassInput {
  final String email;

  ForgetPassInput({required this.email});

  toJson() {
    return {
      "email": email,
    };
  }
}
