class SocialRegisterInput {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final LoginDetailsInput loginDetails;
  final UserRoleEnum role;
  final String providerId;
  final ProviderEnum provider;
  final ProviderAuth authToken;

  SocialRegisterInput(
      {required this.firstName,
      required this.lastName,
      required this.phone,
      required this.email,
      required this.loginDetails,
      required this.role,
      required this.providerId,
      required this.provider,
      required this.authToken});
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

enum ProviderEnum {
  facebook,
  twitter,
  google,
  apple,
}

class ProviderAuth {
  final String authToken;

  ProviderAuth({required this.authToken});
}
