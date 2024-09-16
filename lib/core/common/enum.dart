import 'package:rigow/features/authentication/data/model/input/register/api_register_input.dart';

enum Role {
  user,
  expert,
}

extension RoleExtension on Role {
  String get roleName {
    switch (this) {
      case Role.user:
        return 'USER';
      case Role.expert:
        return 'EXPERT';
      default:
        return '';
    }
  }
}

Role mapApiUserRoleToLocal(ApiUserRoleEnum apiRole) {
  switch (apiRole) {
    case ApiUserRoleEnum.USER:
      return Role.user;
    case ApiUserRoleEnum.EXPERT:
      return Role.expert;
    default:
      throw Exception('Unknown API role: $apiRole');
  }
}
