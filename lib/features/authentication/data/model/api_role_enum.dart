import 'package:rigow/core/common/enum.dart';

enum ApiUserRoleEnum {
  USER,
  EXPERT,
}

ApiUserRoleEnum mapLocalRoleToApi(Role role) {
  switch (role) {
    case Role.user:
      return ApiUserRoleEnum.USER;
    case Role.expert:
      return ApiUserRoleEnum.EXPERT;
    default:
      throw Exception('Unknown local role: $role');
  }
}
