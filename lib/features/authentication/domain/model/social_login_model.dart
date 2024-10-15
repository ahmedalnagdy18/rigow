import 'package:rigow/features/authentication/data/model/api_authentication/api_social_login.dart';

class SocialLoginModel {
  final String? id;
  final String? firstName;
  final String? profilePicture;
  final String? lastName;
  final String? token;

  SocialLoginModel(
      {required this.id,
      required this.firstName,
      required this.profilePicture,
      required this.lastName,
      required this.token});
}

extension SocialLoginToModel on Data {
  SocialLoginModel socialLogModel() {
    return SocialLoginModel(
      firstName: firstName,
      lastName: lastName,
      profilePicture: profilePicture,
      token: token,
      id: id,
    );
  }
}
