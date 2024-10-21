class SocialMergeInput {
  final String providerId;
  final SocialMergeEnum provider;
  final String email;
  final SocialMergeDetailsInput loginDetails;
  final SocialMergeAuth authToken;

  SocialMergeInput(
      {required this.providerId,
      required this.provider,
      required this.email,
      required this.loginDetails,
      required this.authToken});
}

enum SocialMergeEnum {
  facebook,
  twitter,
  google,
  apple,
}

class SocialMergeDetailsInput {
  final String deviceName;
  final SocialMergeDeviceEnum deviceType;

  SocialMergeDetailsInput(
    this.deviceName,
    this.deviceType,
  );
}

enum SocialMergeDeviceEnum { desktop, ios, android }

class SocialMergeAuth {
  final String authToken;

  SocialMergeAuth({required this.authToken});
}
