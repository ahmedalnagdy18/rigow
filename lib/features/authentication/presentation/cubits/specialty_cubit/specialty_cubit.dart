import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/complete_profile_entities/specialty_input.dart';
import 'package:rigow/features/authentication/domain/usecases/complete_profile_usecases/specialty_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/specialty_cubit/specialty_state.dart';

class SpecialtyCubit extends Cubit<SpecialtyState> {
  final SpecialtyUsecase specialtyUsecase;

  SpecialtyCubit({
    required this.specialtyUsecase,
  }) : super(SpecialtyInitial());

  void getAllSpecialtiesFuc(SpecialtyInput specialtyEntity) async {
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
