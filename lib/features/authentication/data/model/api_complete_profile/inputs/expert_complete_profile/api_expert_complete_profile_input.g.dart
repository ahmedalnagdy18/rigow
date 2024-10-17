// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_expert_complete_profile_input.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

// ignore: unused_element
ApiExpertCompleteProfileInput _$ApiExpertCompleteProfileInputFromJson(
        Map<String, dynamic> json) =>
    ApiExpertCompleteProfileInput(
      username: json['username'] as String?,
      countryId: (json['countryId'] as num?)?.toInt(),
      stateId: (json['stateId'] as num?)?.toInt(),
      cityId: (json['cityId'] as num?)?.toInt(),
      gender: $enumDecodeNullable(_$ApiGenderEnumEnumMap, json['gender']),
      birthDate: (json['birthDate'] as num?)?.toInt(),
      specialtyId: (json['specialtyId'] as num?)?.toInt(),
      facultyId: (json['facultyId'] as num?)?.toInt(),
      departmentId: (json['departmentId'] as num?)?.toInt(),
      customfaculty: json['customfaculty'] as String?,
      customDepartment: json['customDepartment'] as String?,
      universityName: json['universityName'] as String?,
      universityDegreeUrl: json['universityDegreeUrl'] as String?,
      otherCertificates: (json['otherCertificates'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      governmentPermitUrl: json['governmentPermitUrl'] as String?,
      fullNameInNationalId: json['fullNameInNationalId'] as String?,
      profilePicture: json['profilePicture'] as String?,
      nationalIdNumber: json['nationalIdNumber'] as String?,
      nationalIdFront: json['nationalIdFront'] as String?,
      nationalIdBack: json['nationalIdBack'] as String?,
      socialLinks: (json['socialLinks'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      bio: json['bio'] as String?,
    );

Map<String, dynamic> _$ApiExpertCompleteProfileInputToJson(
        ApiExpertCompleteProfileInput instance) =>
    <String, dynamic>{
      'username': instance.username,
      'countryId': instance.countryId,
      'stateId': instance.stateId,
      'cityId': instance.cityId,
      'gender': _$ApiGenderEnumEnumMap[instance.gender],
      'birthDate': instance.birthDate,
      'specialtyId': instance.specialtyId,
      'facultyId': instance.facultyId,
      'departmentId': instance.departmentId,
      'customfaculty': instance.customfaculty,
      'customDepartment': instance.customDepartment,
      'universityName': instance.universityName,
      'universityDegreeUrl': instance.universityDegreeUrl,
      'otherCertificates': instance.otherCertificates,
      'governmentPermitUrl': instance.governmentPermitUrl,
      'fullNameInNationalId': instance.fullNameInNationalId,
      'profilePicture': instance.profilePicture,
      'nationalIdNumber': instance.nationalIdNumber,
      'nationalIdFront': instance.nationalIdFront,
      'nationalIdBack': instance.nationalIdBack,
      'socialLinks': instance.socialLinks,
      'bio': instance.bio,
    };

const _$ApiGenderEnumEnumMap = {
  ApiGenderEnum.MALE: 'MALE',
  ApiGenderEnum.FEMALE: 'FEMALE',
};
