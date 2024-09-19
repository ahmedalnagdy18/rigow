import 'package:equatable/equatable.dart';

class CompleteExpertProfileInput extends Equatable {
  final String? username;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? gender;
  final DateTime? birthDate;
  final int? specialtyId;
  final int? facultyId;
  final int? departmentId;
  final String? customFaculty;
  final String? customDepartment;
  final String? universityName;
  final String? universityDegreeUrl;
  final List<String>? otherCertificates;
  final String? governmentPermitUrl;
  final String? fullNameInNationalId;
  final String? profilePicture;
  final String? nationalIdNumber;
  final String? nationalIdFront;
  final String? nationalIdBack;
  final List<String>? socialLinks;
  final String? bio;

  const CompleteExpertProfileInput({
    required this.username,
    required this.countryId,
    required this.stateId,
    required this.cityId,
    required this.gender,
    required this.birthDate,
    required this.specialtyId,
    required this.facultyId,
    required this.departmentId,
    required this.customFaculty,
    required this.customDepartment,
    required this.universityName,
    required this.universityDegreeUrl,
    required this.otherCertificates,
    required this.governmentPermitUrl,
    required this.fullNameInNationalId,
    required this.profilePicture,
    required this.nationalIdNumber,
    required this.nationalIdFront,
    required this.nationalIdBack,
    required this.socialLinks,
    required this.bio,
  });

  @override
  List<Object?> get props => [
        username,
        countryId,
        stateId,
        cityId,
        gender,
        birthDate,
        specialtyId,
        facultyId,
        departmentId,
        customFaculty,
        customDepartment,
        universityName,
        universityDegreeUrl,
        otherCertificates,
        governmentPermitUrl,
        fullNameInNationalId,
        profilePicture,
        nationalIdNumber,
        nationalIdFront,
        nationalIdBack,
        socialLinks,
        bio,
      ];

  toJson() {
    return {
      "username": username,
      "countryId": countryId,
      "stateId": stateId,
      "cityId": cityId,
      "gender": gender!.toUpperCase(),
      "birthDate": birthDate?.millisecondsSinceEpoch,
      "specialtyId": specialtyId,
      "facultyId": facultyId,
      "departmentId": departmentId,
      "customfaculty": customFaculty,
      "customDepartment": customDepartment,
      "universityName": universityName,
      "universityDegreeUrl": universityDegreeUrl,
      "otherCertificates": otherCertificates,
      "governmentPermitUrl": governmentPermitUrl,
      "fullNameInNationalId": fullNameInNationalId,
      "profilePicture": profilePicture,
      "nationalIdNumber": nationalIdNumber,
      "nationalIdFront": nationalIdFront,
      "nationalIdBack": nationalIdBack,
      "socialLinks": socialLinks,
      "bio": bio,
    };
  }
}
