import 'package:rigow/features/authentication/data/model/my_data/api_mydata.dart';

class UserDataEntity {
  final String? firstName;
  final String? lastName;
  final String? username;
  final String? fullName;
  final String? phone;
  final String? gender;
  final String? role;
  final String? profilePicture;
  final bool? hasCompletedRegistration;
  final dynamic token;
  final int? followersCount;
  final int? followingsCount;
  final int? birthDate;
  final String? readableBirthDate;
  final int? createdAt;
  final String? readableCreatedAt;
  final dynamic expertRequestStatus;
  final bool? canPost;
  final bool? isFollowed;
  final ExpertDataUser? expert;

  UserDataEntity(
      {required this.firstName,
      required this.lastName,
      required this.username,
      required this.fullName,
      required this.phone,
      required this.gender,
      required this.role,
      required this.profilePicture,
      required this.hasCompletedRegistration,
      required this.token,
      required this.followersCount,
      required this.followingsCount,
      required this.birthDate,
      required this.readableBirthDate,
      required this.createdAt,
      required this.readableCreatedAt,
      required this.expertRequestStatus,
      required this.canPost,
      required this.isFollowed,
      required this.expert});
}

extension DataMapper on ApiUserDataInfo {
  UserDataEntity toMyData() {
    return UserDataEntity(
      firstName: firstName,
      lastName: lastName,
      username: username,
      fullName: fullName,
      phone: phone,
      gender: gender,
      role: role,
      profilePicture: profilePicture,
      hasCompletedRegistration: hasCompletedRegistration,
      token: token,
      followersCount: followersCount,
      followingsCount: followingsCount,
      birthDate: birthDate,
      readableBirthDate: readableBirthDate,
      createdAt: createdAt,
      readableCreatedAt: readableCreatedAt,
      expertRequestStatus: expertRequestStatus,
      canPost: canPost,
      isFollowed: isFollowed,
      expert: expert?.toExpertData(),
    );
  }
}

class ExpertDataUser {
  final String? bio;
  final List<String>? socialLinks;
  final SpecialtyData? specialty;

  ExpertDataUser(
      {required this.bio, required this.socialLinks, required this.specialty});
}

extension ExpertDataMapper on Expert {
  ExpertDataUser toExpertData() {
    return ExpertDataUser(
      bio: bio,
      socialLinks: socialLinks,
      specialty: specialty?.toSpecialtyData(),
    );
  }
}

class SpecialtyData {
  final String? name;

  SpecialtyData({required this.name});
}

extension SpecialtyDataMapper on Specialty {
  SpecialtyData toSpecialtyData() {
    return SpecialtyData(
      name: name,
    );
  }
}
