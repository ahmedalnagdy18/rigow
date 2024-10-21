import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_check_social_provider.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_forget_pass.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_login.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_logout.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_reset_password.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_social_login.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_social_merge.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_social_register.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_verify_forget_password.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_register_resonse_result.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_send_email_verif.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/api_verify_user.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/forget_password/api_forget_password_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/logout/api_logout_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/register/api_check_social_provider_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/register/api_register_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/register/api_social_login_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/register/api_social_register_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/reset_password/api_reset_password_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/send_email_verification/api_send_email_verification_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/social_merge/api_social_merge_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/verify_forget_password/api_verify_forget_password_input.dart';
import 'package:rigow/features/authentication/data/model/api_authentication/input/verify_user/api_verify_user_input.dart';
import 'package:rigow/features/authentication/data/model/my_data/api_mydata.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/all_user_data.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/check_social_provider_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/forget_pass_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/login_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/logout_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/my_data_inputs.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/reset_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_login_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_merge_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_forget_password_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/register_input.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/user_data_for_complete.dart';
import 'package:rigow/features/authentication/domain/entities/authentication_entities/verify_user_input.dart';
import 'package:rigow/features/authentication/domain/model/check_provider_model.dart';
import 'package:rigow/features/authentication/domain/model/social_login_model.dart';
import 'package:rigow/features/authentication/domain/model/social_merge_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImp extends AuthenticationRepository {
  final GraphQLClient graphQLClient;

  AuthenticationRepositoryImp({required this.graphQLClient});

  @override
  Future<void> forgetPassword(ForgetPassInput input) async {
    final result = await graphQLClient
        .mutate(MutationOptions(document: gql(forgetPasswordd), variables: {
      "input": ApiForgetPasswordInput.fromInput(input).toJson(),
    }));

    final response = ApiForgetPassword.fromJson(result.data!);

    if (response.forgetPassword != null &&
        response.forgetPassword!.code == 200) {
      return;
    } else {
      throw FormatException(response.forgetPassword?.message ?? "");
    }
  }

  @override
  Future<AllUserData> loginWithEmailAndPassword(LoginInput input) async {
    final result = await graphQLClient.mutate(MutationOptions(
        document: gql(loginn), variables: {"input": input.toJson()}));

    final response = ApiLogin.fromJson(result.data!);

    if (response.emailAndPasswordLogin != null &&
        response.emailAndPasswordLogin!.code == 200) {
      final token = response.emailAndPasswordLogin?.data?.token;
      final data = response.emailAndPasswordLogin?.data;
      final allUserData = data!.toUserDataForuser();

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');

      return allUserData;
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
  Future<void> resetPasswordByEmail(ResetPasswordInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(resetPasswordByEmaill),
        variables: {
          "input": ApiResetPasswordInput.fromInput(input).toJson(),
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
      SendEmailVerificationCodeInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(sendEmailVerificationCodee),
        variables: {
          "input": ApiSendEmailVerificationInput.fromInput(input).toJson(),
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
  Future<void> verifyForgetPassword(VerifyForgetPasswordInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyForgetPasswordCodee),
        variables: {
          "input": ApiVerifyForgetPasswordInput.fromInput(input).toJson(),
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
  Future<UserDataForComplete> verifyUserByEmail(VerifyUserInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(verifyUserByEmailInput),
        variables: {
          "input": ApiVerifyUserInput.fromInput(input).toJson(),
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

  @override
  Future<void> socialRegister(SocialRegisterInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(socialRegisterr),
        variables: {
          "input": ApiSocialRegisterInput.fromInput(input).toJson(),
        },
      ),
    );

    final response = ApiSocialRegister.fromJson(result.data!).socialRegister;

    if (response != null && response.code == 200) {
      final token = response.data?.token;
      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      return;
    } else {
      throw FormatException(response?.message ?? "");
    }
  }

  @override
  Future<UserDataEntity> myData() async {
    final result = await graphQLClient.query(
      QueryOptions(
        document: gql(myDataa),
      ),
    );

    final response = ApiMyData.fromJson(result.data!).me;

    if (response != null && response.code == 200) {
      final data = response.data;
      final allMyData = data!.toMyData();

      return allMyData;
    } else {
      throw FormatException(response?.message ?? "");
    }
  }

  @override
  Future<void> logout(LogoutInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(logoutFromAcc),
        variables: ApiLogoutInput.fromInput(input).toJson(),
      ),
    );
    final response = ApiLogout.fromJson(result.data!).logout;

    if (response != null && response.code == 200) {
      return;
    } else {
      throw FormatException(response?.message ?? "");
    }
  }

  @override
  Future<CheckProviderModel> checkSocialProvider(
      CheckSocialProviderInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(checkSocialProviderStatuss),
        variables: {
          "input": ApiCheckSocialProviderInput.fromInput(input).toJson(),
        },
      ),
    );

    final response =
        ApiCheckSocialProvider.fromJson(result.data!).checkSocialProviderStatus;
    if (response != null && response.code == 200 && response.data != null) {
      return response.data!.mapCheck();
    } else {
      throw FormatException(response?.message ?? "");
    }
  }

  @override
  Future<SocialLoginModel> socialLogin(SocialLoginInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(socialLoginn),
        variables: {
          "input": ApiSocialLoginInput.fromInput(input).toJson(),
        },
      ),
    );

    final response = ApiSocialLogin.fromJson(result.data!).socialLogin;
    if (response != null && response.code == 200) {
      final data = response.data;
      final allMyData = data?.socialLogModel();
      final token = response.data?.token;

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      return allMyData!;
    } else {
      throw FormatException(response?.message ?? "");
    }
  }

  @override
  Future<SocialMergeModel> socialMerge(SocialMergeInput input) async {
    final result = await graphQLClient.mutate(
      MutationOptions(
        document: gql(socialMergee),
        variables: {
          "input": ApiSocialMergeInput.fromInput(input).toJson(),
        },
      ),
    );

    final response = ApiSocialMerge.fromJson(result.data!).socialMerge;
    if (response != null && response.code == 200) {
      final data = response.data;
      final allMyData = data?.socialMergeModel();
      final token = response.data?.token;

      SharedPrefrance.instanc.setToken(key: 'token', token: token ?? '');
      return allMyData!;
    } else {
      throw FormatException(response?.message ?? "");
    }
  }
}
