import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_social_login.dart';

class SocialLoginModel extends Equatable {
  final String? id;
  final String? firstName;
  final String? profilePicture;
  final String? lastName;
  final String? token;

  const SocialLoginModel(
      {required this.id,
      required this.firstName,
      required this.profilePicture,
      required this.lastName,
      required this.token});

  @override
  List<Object?> get props => [
        id,
        firstName,
        profilePicture,
        lastName,
        token,
      ];
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
