import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_login_part/api_forget_pass.dart';
import 'package:rigow/features/authentication/data/model/api_login_part/api_login.dart';
import 'package:rigow/features/authentication/data/model/api_login_part/api_reset_password.dart';
import 'package:rigow/features/authentication/data/model/api_login_part/api_verify_forget_password.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/sign_up_part/api_register_resonse_result.dart';
import 'package:rigow/features/authentication/data/model/api_send_email_verif.dart';
import 'package:rigow/features/authentication/data/model/api_verify_user.dart';
import 'package:rigow/features/authentication/data/model/input/register/api_register_input.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/forget_pass_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/login_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/reset_password_entity.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/verify_forget_password_entity.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/signup_part_entity/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/verify_user_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository {
  final GraphQLClient graphQLClient;

  AuthenticationRepositoryImp({required this.graphQLClient});

  @override
  Future<void> forgetPassword(ForgetPassEntity forgetPassEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(forgetPasswordd),
        variables: {"input": forgetPassEntity.toJson()}));

    final response = ApiForgetPassword.fromJson(result.data!);

    if (response.forgetPassword != null &&
        response.forgetPassword!.code == 200) {
      return;
    } else {
      throw FormatException(response.forgetPassword?.message ?? "");
    }
  }

  @override
  Future<void> loginWithEmailAndPassword(LoginEntity loginEntity) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(loginn), variables: {"input": loginEntity.toJson()}));

    final response = ApiLogin.fromJson(result.data!);

    if (response.emailAndPasswordLogin != null &&
        response.emailAndPasswordLogin!.code == 200) {
      final token = response.emailAndPasswordLogin?.data?.token;

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      return;
    } else {
      throw FormatException(response.emailAndPasswordLogin?.message ?? "");
    }
  }

  @override
  Future<void> register(RegisterInput input) async {
    final registerApiResult = await graphQLClient
        .mutate(MutationOptions(document: gql(registerMutation), variables: {
      "input": ApiRegisterInput.fromInput(input).toJson(),
    }));

    if (registerApiResult.hasException || registerApiResult.data == null) {
      throw Exception();
    }
    final response =
        ApiRegisterResponseResult.fromJson(registerApiResult.data!).register;
    if (response!.data != null && response.code == 200) {
      return;
    } else {
      throw FormatException(response.message ?? "");
    }
  }

  @override
  Future<void> resetPasswordByEmail(
      ResetPasswordEntity resetPasswordEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(resetPasswordByEmaill),
        variables: {
          "input": resetPasswordEntity.toJson(),
        },
      ),
    );

    if (result.data == null) {
      throw Exception();
    }

    final response = ApiResetPasswordByEmail.fromJson(result.data!);
    if (response.resetPasswordByEmail != null &&
        response.resetPasswordByEmail!.code == 200) {
      return;
    } else {
      throw FormatException(response.resetPasswordByEmail?.message ?? "");
    }
  }

  @override
  Future<void> sendEmailVerificationCode(
      SendEmailVerificationCodeEntity emailVerificationCodeEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(sendEmailVerificationCodee),
        variables: {
          "input": emailVerificationCodeEntity.toJson(),
        },
      ),
    );
    if (result.data == null) {
      throw Exception();
    }
    final response = ApiSendEmailVerificationCode.fromJson(result.data!);
    if (response.sendEmailVerificationCode != null &&
        response.sendEmailVerificationCode?.code == 200) {
      return;
    } else {
      throw FormatException(response.sendEmailVerificationCode?.message ?? "");
    }
  }

  @override
  Future<void> verifyForgetPassword(
      VerifyForgetPasswordEntity verifyForgetPasswordEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyForgetPasswordCodee),
        variables: {
          "input": verifyForgetPasswordEntity.toJson(),
        },
      ),
    );

    if (result.data == null) {}
    final response = ApiVerifyForgetPasswordCode.fromJson(result.data!);
    if (response.verifyForgetPasswordCode != null &&
        response.verifyForgetPasswordCode?.code == 200) {
      final data = response.verifyForgetPasswordCode?.data;

      if (data == null) {
        throw const FormatException("Invalid data received.");
      }

      return;
    } else {
      throw FormatException(response.verifyForgetPasswordCode?.message ?? "");
    }
  }

  @override
  Future<UserDataForComplete> verifyUserByEmail(
      VerifyUserEntity verifyUserEntity) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyUserByEmailInput),
        variables: {
          "input": verifyUserEntity.toJson(),
        },
      ),
    );

    if (result.data == null) {}
    final response = ApiVerifyUserByEmail.fromJson(result.data!);
    if (response.verifyUserByEmail != null &&
        response.verifyUserByEmail?.code == 200) {
      final data = response.verifyUserByEmail?.data;
      final token = response.verifyUserByEmail?.data?.token;

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      if (data == null) {
        throw const FormatException("Invalid data received.");
      }

      return data.toUserDataForComplete();
    } else {
      throw FormatException(response.verifyUserByEmail?.message ?? "");
    }
  }
}
