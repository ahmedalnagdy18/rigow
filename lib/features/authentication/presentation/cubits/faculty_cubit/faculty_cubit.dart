import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rigow/features/authentication/domain/entities/register_part_entity/complete_profile_entity/faculty_entity.dart';
import 'package:rigow/features/authentication/domain/usecases/register_part_usecase/complete_profile_part/faculty_usecase.dart';
import 'package:rigow/features/authentication/presentation/cubits/faculty_cubit/faculty_state.dart';

class FacultyCubit extends Cubit<FacultyState> {
  final FacultyUsecase facultyUsecase;

  FacultyCubit({required this.facultyUsecase}) : super(FacultyInitial());

  void getFaculties(FacultyEntity facultyEntity) async {
    emit(LoadingFacultyState());
    try {
      final data = await facultyUsecase.call(facultyEntity);
      emit(SucsessFacultyState(specialtyItems: data));
    } catch (e) {
      if (e is FormatException) {
        emit(ErrorFacultyState(message: e.message));
      }
      rethrow;
    }
    emit(FacultyInitial());
  }
}
