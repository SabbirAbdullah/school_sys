import '../model/diary_model.dart';

abstract class DiaryState {}

class DiaryInitial extends DiaryState {}

class DiaryLoading extends DiaryState {}

class DiaryLoaded extends DiaryState {
  final List<DiaryModel> diaries;

  DiaryLoaded(this.diaries);
}

class DiaryError extends DiaryState {
  final String message;
  DiaryError(this.message);
}
