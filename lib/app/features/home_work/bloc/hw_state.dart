
import '../model/hw_model.dart';


abstract class HomeWorkState {}

class HomeWorkInitial extends HomeWorkState {}

class HomeWorkLoading extends HomeWorkState {}

class HomeWorkLoaded extends HomeWorkState {
  final List<HomeWorkModel> diaries;

  HomeWorkLoaded(this.diaries);
}

class HomeWorkError extends HomeWorkState {
  final String message;
  HomeWorkError(this.message);
}
