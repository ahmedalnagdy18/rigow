class ResetPasswordInput {
  final String email;
  final String newPassword;
  final String code;

  ResetPasswordInput(
      {required this.email, required this.newPassword, required this.code});
}
