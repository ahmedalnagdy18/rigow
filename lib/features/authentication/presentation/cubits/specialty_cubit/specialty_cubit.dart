import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/specialty_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/specialty_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/specialty_cubit/specialty_state.dart';

class SpecialtyCubit extends Cubit<SpecialtyState> {
  final SpecialtyUsecase specialtyUsecase;

  SpecialtyCubit({
    required this.specialtyUsecase,
  }) : super(SpecialtyInitial());

  void specialties(SpecialtyEntity specialtyEntity) async {
    emit(LoadingSpecialtyState());
    try {
      final data = await specialtyUsecase.call(specialtyEntity);
      emit(SucsessSpecialtyState(specialtyItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorSpecialtyState(message: e.message));
      }
      rethrow;
    }
    emit(SpecialtyInitial());
  }
}
