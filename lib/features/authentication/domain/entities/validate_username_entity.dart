class ValidateUsernameEntity {
  final String username;

  ValidateUsernameEntity({required this.username});
  toJson() {
    return {
      "username": username,
    };
  }
}
