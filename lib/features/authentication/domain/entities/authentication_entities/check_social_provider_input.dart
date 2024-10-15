class CheckSocialProviderInput {
  final String email;
  final String providerId;
  final CheckProviderEnum provider;
  final CheckProviderAuth authToken;

  CheckSocialProviderInput(
      {required this.email,
      required this.providerId,
      required this.provider,
      required this.authToken});
}

enum CheckProviderEnum {
  facebook,
  twitter,
  google,
  apple,
}

class CheckProviderAuth {
  final String authToken;

  CheckProviderAuth({required this.authToken});
}
