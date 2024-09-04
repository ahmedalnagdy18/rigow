class ForgetPassEntity {
  final String email;

  ForgetPassEntity({required this.email});

  toJson() {
    return {
      "email": email,
    };
  }
}
