import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/logout_input.dart';

part 'api_logout_input.g.dart';

@JsonSerializable()
class ApiLogoutInput {
  final ApiDeviceEnum device;

  ApiLogoutInput({required this.device});

  factory ApiLogoutInput.fromJson(Map<String, dynamic> json) =>
      _$ApiLogoutInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLogoutInputToJson(this);

  factory ApiLogoutInput.fromInput(LogoutInput input) {
    return ApiLogoutInput(
      device: deviceEnum(input.deviceType),
    );
  }
}

enum ApiDeviceEnum {
  DESKTOP,
  IOS,
  ANDROID,
}

ApiDeviceEnum deviceEnum(LogutDeviceEnum type) {
  switch (type) {
    case LogutDeviceEnum.android:
      return ApiDeviceEnum.ANDROID;
    case LogutDeviceEnum.desktop:
      return ApiDeviceEnum.DESKTOP;
    case LogutDeviceEnum.ios:
      return ApiDeviceEnum.IOS;
  }
}
