class RegisterInput {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final LoginDetailsInput loginDetails;
  final UserRoleEnum role;

  RegisterInput({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.loginDetails,
    required this.role,
  });
}

class LoginDetailsInput {
  final String deviceName;
  final DeviceEnum deviceType;

  LoginDetailsInput(
    this.deviceName,
    this.deviceType,
  );
}

enum DeviceEnum { desktop, ios, android }

enum UserRoleEnum {
  user,
  expert,
  admin,
}
