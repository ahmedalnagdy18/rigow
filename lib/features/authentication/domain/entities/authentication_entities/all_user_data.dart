import 'package:rigow/features/authentication/data/model/api_authentication/api_login.dart';

class AllUserData {
  final String firstName;
  final String profilePic;

  AllUserData({required this.firstName, required this.profilePic});
}

extension DataMapper on Data {
  AllUserData toUserDataForuser() {
    return AllUserData(
      firstName: firstName ?? '',
      profilePic: profilePicture ?? '',
    );
  }
}
