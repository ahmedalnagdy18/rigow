import 'package:rigow/features/authentication/data/model/api_verify_user.dart';

class UserDataForComplete {
  final String firstName;
  final String lastName;
  final String token;

  UserDataForComplete(
      {required this.firstName, required this.token, required this.lastName});
}

extension DataMapper on Data {
  UserDataForComplete toUserDataForComplete() {
    return UserDataForComplete(
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      token: token ?? '',
    );
  }
}
