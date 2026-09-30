// class_routine_state.dart
import '../model/class_routine_model.dart';

abstract class ClassRoutineState {}

class ClassRoutineInitial extends ClassRoutineState {}

class ClassRoutineLoading extends ClassRoutineState {}

class ClassRoutineLoaded extends ClassRoutineState {
  final List<ClassRoutineModel> routines;

  ClassRoutineLoaded(this.routines);
}

class ClassRoutineError extends ClassRoutineState {
  final String message;

  ClassRoutineError(this.message);
}
