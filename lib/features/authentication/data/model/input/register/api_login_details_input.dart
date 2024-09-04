import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/signup_part_entity/register_input.dart';

part 'api_login_details_input.g.dart';

@JsonSerializable()
class ApiLoginDetailsInput {
  final String deviceName;
  final ApiDeviceEnum device;

  ApiLoginDetailsInput({
    required this.deviceName,
    required this.device,
  });
  factory ApiLoginDetailsInput.fromJson(Map<String, dynamic> json) =>
      _$ApiLoginDetailsInputFromJson(json);

  Map<String, dynamic> toJson() => _$ApiLoginDetailsInputToJson(this);

  factory ApiLoginDetailsInput.fromInput(LoginDetailsInput input) {
    return ApiLoginDetailsInput(
      deviceName: input.deviceName,
      device: input.deviceType.apiDeviceEnum(),
    );
  }
}

enum ApiDeviceEnum {
  DESKTOP,
  IOS,
  ANDROID,
}

extension ApiDeviceEnumExtension on DeviceEnum {
  ApiDeviceEnum apiDeviceEnum() {
    switch (this) {
      case DeviceEnum.desktop:
        return ApiDeviceEnum.DESKTOP;
      case DeviceEnum.ios:
        return ApiDeviceEnum.IOS;
      case DeviceEnum.android:
        return ApiDeviceEnum.ANDROID;
      default:
        throw Exception('Invalid ApiDeviceEnum value');
    }
  }
}
