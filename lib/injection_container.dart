import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/data/repositories/authentication_repository_imp/authentication_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/complete_profile_imp/complete_profile_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/upload_imp/upload_photo_imp.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rigow/features/authentication/domain/repositories/complete_profile_repository.dart';
import 'package:rigow/features/authentication/domain/repositories/upload_files_repository.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/social_register_usecase.dart';

import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/city_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/complete_expert_profile_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/complete_profile_user_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/countries_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/forget_pass_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/login_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/department_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/faculty_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/register_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/reset_password_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/specialty_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/states_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/validate_username_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/verify_forget_password_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/upload_usecase/upload_photo_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/authentication_usecases/verify_user_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - auchentication

// Usecases
  sl.registerLazySingleton<LoginUsecase>(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: sl()));

  sl.registerLazySingleton<SendEmailVerificationCodeUsecase>(
      () => SendEmailVerificationCodeUsecase(repository: sl()));

  sl.registerLazySingleton<VerifyUserUsecase>(
      () => VerifyUserUsecase(repository: sl()));

  sl.registerLazySingleton<ValidateUsernameUsecase>(
      () => ValidateUsernameUsecase(repository: sl()));

  sl.registerLazySingleton<CompleteProfileUserUsecase>(
      () => CompleteProfileUserUsecase(repository: sl()));

  sl.registerLazySingleton<CountriesUsecase>(
      () => CountriesUsecase(repository: sl()));

  sl.registerLazySingleton<StatesUsecase>(
      () => StatesUsecase(repository: sl()));

  sl.registerLazySingleton<CityUsecase>(() => CityUsecase(repository: sl()));

  sl.registerLazySingleton<ForgetPassUsecase>(
      () => ForgetPassUsecase(repository: sl()));

  sl.registerLazySingleton<ResetPasswordUsecase>(
      () => ResetPasswordUsecase(repository: sl()));

  sl.registerLazySingleton<VerifyForgetPasswordUsecase>(
      () => VerifyForgetPasswordUsecase(repository: sl()));

  sl.registerLazySingleton<SpecialtyUsecase>(
      () => SpecialtyUsecase(repository: sl()));

  sl.registerLazySingleton<FacultyUsecase>(
      () => FacultyUsecase(repository: sl()));

  sl.registerLazySingleton<DepartmentUsecase>(
      () => DepartmentUsecase(repository: sl()));

  sl.registerLazySingleton<CompleteExpertProfileUsecase>(
      () => CompleteExpertProfileUsecase(repository: sl()));

  sl.registerLazySingleton<UploadFileUsecase>(
      () => UploadFileUsecase(repository: sl()));

  sl.registerLazySingleton<SocialRegisterUsecase>(
      () => SocialRegisterUsecase(repository: sl()));

// Repository

  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<CompleteProfileRepository>(
      () => CompleteProfileRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<UploadFileRepository>(
      () => UploadFileRepositoryImp(graphQLClient: sl()));

//---------------------------------------------------------------------------------------------------
  sl.registerLazySingleton<GraphQLClient>(() {
    final authLink = AuthLink(getToken: () async {
      final token = await getToken();
      return "Bearer $token";
    });

    final httpLink = HttpLink(
      "https://beta-api.rigow.com/graphql",
      defaultHeaders: {
        "Apollo-Require-Preflight": "true",
      },
    );

    return GraphQLClient(
      link: authLink.concat(httpLink),
      cache: GraphQLCache(),
    );
  });
}

Future<String> getToken() async {
  return SharedPrefrance.instanc.getToken('token') ?? '';
}
