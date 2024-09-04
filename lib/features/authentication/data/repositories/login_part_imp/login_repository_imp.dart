import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/core/shared_prefrances/shared_prefrance.dart';
import 'package:rigow/features/authentication/data/model/api_login_part/api_login.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/domain/entities/login_part_entity/login_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class LoginRepositryImp implements LoginRepository {
  final GraphQLClient graphQLClient;

  LoginRepositryImp({required this.graphQLClient});

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
}
