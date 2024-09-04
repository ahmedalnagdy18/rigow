class LoginEntity {
  final String email;
  final String password;
  final String deviceType;
  final String role;

  LoginEntity(
      {required this.role,
      required this.email,
      required this.password,
      required this.deviceType});

  toJson() {
    return {
      "email": email,
      "password": password,
      "device": deviceType.toUpperCase(),
      "role": role.toUpperCase(),
    };
  }
}
