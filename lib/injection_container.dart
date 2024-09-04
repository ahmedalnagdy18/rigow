import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/data/repositories/city_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/complete_profile_user_repo_imp.dart';
import 'package:rigow/features/authentication/data/repositories/countries_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/forget_pass_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/login_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/register_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/reset_password_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/send_email_verification.dart';
import 'package:rigow/features/authentication/data/repositories/specialty_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/states_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/validate_username_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/verify_forget_password_repository_imp.dart';
import 'package:rigow/features/authentication/data/repositories/verify_user_repository_imp.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rigow/features/authentication/domain/usecases/city_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_user_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/countries_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/forget_pass_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/login_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/register_usecase.dart';
import 'package:get_it/get_it.dart';
import 'package:rigow/features/authentication/domain/usecases/reset_password_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/send_email_verification.dart';
import 'package:rigow/features/authentication/domain/usecases/specialty_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/states_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/validate_username_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/verify_forget_password_usecase.dart';
import 'package:rigow/features/authentication/domain/usecases/verify_user_usecase.dart';

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
// Repository

  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositryImp(graphQLClient: sl()));

  sl.registerLazySingleton<SendEmailVerificationCodeRepository>(
      () => SendEmailVerificationCodeRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<VerifyUserRepository>(
      () => VerifyUserRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<ValidateUsernameRepository>(
      () => ValidateUsernameRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<CompleteProfileUserRepository>(
      () => CompleteProfileUserRepoImp(graphQLClient: sl()));

  sl.registerLazySingleton<CountriesRepository>(
      () => CountriesRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<StatesRepository>(
      () => StatesRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<CityRepository>(
      () => CityRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<ForgetPassRepository>(
      () => ForgetPassRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<ResetPasswordRepository>(
      () => ResetPasswordRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<VerifyForgetPasswordRepository>(
      () => VerifyForgetPasswordRepositoryImp(graphQLClient: sl()));

  sl.registerLazySingleton<SpecialtyRepository>(
      () => SpecialtyRepositoryImp(graphQLClient: sl()));

//---------------------------------------------------------------------------------------------------
  sl.registerLazySingleton<GraphQLClient>(() {
    final authLink = AuthLink(getToken: () async {
      final token = await getToken();
      return "Bearer $token";
    });

    final httpLink = HttpLink("https://beta-api.rigow.com/graphql");

    return GraphQLClient(
      link: authLink.concat(httpLink),
      cache: GraphQLCache(),
    );
  });
}

Future<String> getToken() async {
  return SharedPrefrance.instanc.getToken('token') ?? '';
}
