import 'package:school_sys/app/features/class_work/model/cw_model.dart';


abstract class ClassWorkState {}

class ClassWorkInitial extends ClassWorkState {}

class ClassWorkLoading extends ClassWorkState {}

class ClassWorkLoaded extends ClassWorkState {
  final List<ClassWorkModel> diaries;

  ClassWorkLoaded(this.diaries);
}

class ClassWorkError extends ClassWorkState {
  final String message;
  ClassWorkError(this.message);
}
