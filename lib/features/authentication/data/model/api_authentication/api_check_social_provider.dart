import 'dart:convert';

import 'package:rigow/features/authentication/data/model/my_data/api_mydata.dart';

class ApiCheckSocialProvider {
  final CheckSocialProviderStatus? checkSocialProviderStatus;

  ApiCheckSocialProvider({
    this.checkSocialProviderStatus,
  });

  factory ApiCheckSocialProvider.fromRawJson(String str) =>
      ApiCheckSocialProvider.fromJson(json.decode(str));

  factory ApiCheckSocialProvider.fromJson(Map<String, dynamic> json) =>
      ApiCheckSocialProvider(
        checkSocialProviderStatus: json["checkSocialProviderStatus"] == null
            ? null
            : CheckSocialProviderStatus.fromJson(
                json["checkSocialProviderStatus"]),
      );
}

class CheckSocialProviderStatus {
  final ApiData? data;
  final int? code;
  final bool? success;
  final String? message;

  CheckSocialProviderStatus({
    this.data,
    this.code,
    this.success,
    this.message,
  });

  factory CheckSocialProviderStatus.fromRawJson(String str) =>
      CheckSocialProviderStatus.fromJson(json.decode(str));

  factory CheckSocialProviderStatus.fromJson(Map<String, dynamic> json) =>
      CheckSocialProviderStatus(
        data: json["data"] == null ? null : ApiData.fromJson(json["data"]),
        code: json["code"],
        success: json["success"],
        message: json["message"],
      );
}

//! add Api user info
class ApiData {
  final ApiUserDataInfo? user;

  ApiData({
    this.user,
  });

  factory ApiData.fromRawJson(String str) => ApiData.fromJson(json.decode(str));

  factory ApiData.fromJson(Map<String, dynamic> json) => ApiData(
        user: json["user"] == null
            ? null
            : ApiUserDataInfo.fromJson(json["user"]),
      );
}
