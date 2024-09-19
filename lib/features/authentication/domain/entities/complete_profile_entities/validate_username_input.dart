class ValidateUsernameInput {
  final String username;

  ValidateUsernameInput({required this.username});
  toJson() {
    return {
      "username": username,
    };
  }
}
