import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/complete_expert_profile_data_input.dart';

part 'api_expert_complete_profile_input.g.dart';

@JsonSerializable()
class ApiExpertCompleteProfileInput {
  final String? username;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final ApiGenderEnum? gender;
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

  const ApiExpertCompleteProfileInput({
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

  Map<String, dynamic> toJson() => _$ApiExpertCompleteProfileInputToJson(this);

  factory ApiExpertCompleteProfileInput.fromInput(
      CompleteExpertProfileInput input) {
    return ApiExpertCompleteProfileInput(
      username: input.username,
      countryId: input.countryId,
      stateId: input.stateId,
      cityId: input.cityId,
      gender: gendetToApi(input.gender),
      birthDate: input.birthDate,
      specialtyId: input.specialtyId,
      facultyId: input.facultyId,
      departmentId: input.departmentId,
      customfaculty: input.customfaculty,
      customDepartment: input.customDepartment,
      universityName: input.universityName,
      universityDegreeUrl: input.universityDegreeUrl,
      otherCertificates: input.otherCertificates,
      governmentPermitUrl: input.governmentPermitUrl,
      fullNameInNationalId: input.fullNameInNationalId,
      profilePicture: input.profilePicture,
      nationalIdNumber: input.nationalIdNumber,
      nationalIdFront: input.nationalIdFront,
      nationalIdBack: input.nationalIdBack,
      socialLinks: input.socialLinks,
      bio: input.bio,
    );
  }
}

enum ApiGenderEnum { MALE, FEMALE }

ApiGenderEnum gendetToApi(UserGenderEnum type) {
  switch (type) {
    case UserGenderEnum.male:
      return ApiGenderEnum.MALE;
    case UserGenderEnum.female:
      return ApiGenderEnum.FEMALE;
  }
}
