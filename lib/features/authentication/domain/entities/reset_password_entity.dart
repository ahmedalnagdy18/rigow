class ResetPasswordEntity {
  final String email;
  final String newPassword;
  final String code;

  ResetPasswordEntity(
      {required this.email, required this.newPassword, required this.code});

  toJson() {
    return {
      "email": email,
      "newPassword": newPassword,
      "code": code,
    };
  }
}
