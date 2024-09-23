import 'package:equatable/equatable.dart';

class CompleteExpertProfileInput extends Equatable {
  final String? username;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final UserGenderEnum gender;
  final int? birthDate;
  final int? specialtyId;
  final int? facultyId;
  final int? departmentId;
  final String? customfaculty;
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
    required this.customfaculty,
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
        customfaculty,
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
}

enum UserGenderEnum {
  male,
  female,
}
