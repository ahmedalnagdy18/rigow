import 'package:json_annotation/json_annotation.dart';
import 'package:rigow/features/authentication/data/model/input/register/api_login_details_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';

part 'api_register_input.g.dart';

@JsonSerializable()
class ApiRegisterInput {
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String password;
  final ApiLoginDetailsInput loginDetails;
  final ApiUserRoleEnum role;

  ApiRegisterInput({
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.password,
    required this.loginDetails,
    required this.role,
  });

  Map<String, dynamic> toJson() => _$ApiRegisterInputToJson(this);

  factory ApiRegisterInput.fromInput(RegisterInput input) {
    return ApiRegisterInput(
      firstName: input.firstName,
      lastName: input.lastName,
      phone: input.phone,
      email: input.email,
      password: input.password,
      loginDetails: ApiLoginDetailsInput.fromInput(input.loginDetails),
      role: ApiUserRoleEnum.USER, //todo:need to refactor....
    );
  }
}

enum ApiUserRoleEnum { USER, EXPERT, APP_ADMIN }
