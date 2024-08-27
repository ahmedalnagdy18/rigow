import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:rigow/features/authentication/data/data_source/qraph_ql.dart';
import 'package:rigow/features/authentication/data/model/api_forget_pass.dart';
import 'package:rigow/features/authentication/domain/entities/forget_pass_entity.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class ForgetPassRepositoryImp implements ForgetPassRepository {
  final GraphQLClient graphQLClient;

  ForgetPassRepositoryImp({required this.graphQLClient});

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
}
