class SocialLoginInput {
  final SocialLoginDetailsInput loginDetails;
  final SocialUserRoleEnum role;
  final String providerId;

  final SocialProviderEnum provider;

  SocialLoginInput(
      {required this.loginDetails,
      required this.role,
      required this.providerId,
      required this.provider});
}

class SocialLoginDetailsInput {
  final String deviceName;
  final SocialDeviceEnum deviceType;

  SocialLoginDetailsInput(
    this.deviceName,
    this.deviceType,
  );
}

enum SocialUserRoleEnum {
  user,
  expert,
  admin,
}

enum SocialDeviceEnum { desktop, ios, android }

enum SocialProviderEnum {
  facebook,
  twitter,
  google,
  apple,
}
