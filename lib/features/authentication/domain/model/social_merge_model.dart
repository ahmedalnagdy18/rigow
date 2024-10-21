import 'package:rigow/features/authentication/data/model/api_authentication/api_social_merge.dart';

class SocialMergeModel {
  final String id;
  final String firstName;
  final String profilePicture;
  final String lastName;
  final String token;

  SocialMergeModel(
      {required this.id,
      required this.firstName,
      required this.profilePicture,
      required this.lastName,
      required this.token});
}

extension SocialMergetoModel on Data {
  SocialMergeModel socialMergeModel() {
    return SocialMergeModel(
      firstName: firstName ?? "",
      lastName: lastName ?? "",
      profilePicture: profilePicture ?? "",
      token: token ?? "",
      id: id ?? "",
    );
  }
}
