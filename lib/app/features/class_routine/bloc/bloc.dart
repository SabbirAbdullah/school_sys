// class_routine_bloc.dart
import 'package:bloc/bloc.dart';

import '../model/class_routine_model.dart';
import 'bloc_event.dart';
import 'bloc_state.dart';

class ClassRoutineBloc extends Bloc<ClassRoutineEvent, ClassRoutineState> {
  ClassRoutineBloc() : super(ClassRoutineInitial()) {
    on<LoadClassRoutine>(_onLoadRoutine);
  }

  Future<void> _onLoadRoutine(LoadClassRoutine event, Emitter<ClassRoutineState> emit) async {
    emit(ClassRoutineLoading());

    try {
      // Replace this with actual API call
      final routines = await fetchClassRoutineFromApi();
      emit(ClassRoutineLoaded(routines));
    } catch (e) {
      emit(ClassRoutineError("Failed to load routines"));
    }
  }

  Future<List<ClassRoutineModel>> fetchClassRoutineFromApi() async {
    await Future.delayed(Duration(seconds: 1)); // Simulate network delay
    return [
      ClassRoutineModel(dayName: "SAT", slotName: "1", subjectName: "Math", teacherFname: "Sabbir", teacherLname: "Abdullah"),
      ClassRoutineModel(dayName: "SUN", slotName: "1", subjectName: "Math", teacherFname: "Alice", teacherLname: "Smith"),
      ClassRoutineModel(dayName: "MON", slotName: "2", subjectName: "Science", teacherFname: "Bob", teacherLname: "Jones"),
      // Add more...
    ];
  }
}
