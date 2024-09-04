import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_register_part/sign_up_part/api_register_resonse_result.dart';
import 'package:rigow/features/authentication/data/model/input/register/api_register_input.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/signup_part_entity/register_input.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class RegisterRepositryImp implements RegisterRepository {
  final GraphQLClient graphQLClient;

  RegisterRepositryImp({required this.graphQLClient});

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
}
