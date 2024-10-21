import 'package:equatable/equatable.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_check_social_provider.dart';

class CheckProviderModel extends Equatable {
  final String? actionRequired;
  final String? token;

  const CheckProviderModel({required this.actionRequired, required this.token});

  @override
  List<Object?> get props => [
        actionRequired,
      ];
}

enum CheckProviderEnum {
  registerVerification,
  register,
  merge,
}

extension ConvertCheckModelToApiCheckItemData on Data {
  CheckProviderModel mapCheck() {
    return CheckProviderModel(
      actionRequired: actionRequired,
      token: user?.token,
    );
  }
}
