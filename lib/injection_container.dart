import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/data/repositories/register_repository_imp.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';
import 'package:rigow/features/authentication/domain/usecases/register_usecase.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
//! Features - auchentication

// Usecases

  sl.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecase(repository: sl()));

// Repository

  sl.registerLazySingleton<RegisterRepository>(
      () => RegisterRepositryImp(graphQLClient: sl()));

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
