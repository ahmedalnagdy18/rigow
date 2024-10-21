import 'package:rigow/features/authentication/domain/entities/authentication_entities/social_merge_input.dart';
import 'package:rigow/features/authentication/domain/model/social_merge_model.dart';
import 'package:rigow/features/authentication/domain/repositories/authentication_repository.dart';

class SocialMergeUsecase {
  final AuthenticationRepository repository;

  SocialMergeUsecase({required this.repository});
  Future<SocialMergeModel> execute(SocialMergeInput input) async {
    return await repository.socialMerge(input);
  }
}
