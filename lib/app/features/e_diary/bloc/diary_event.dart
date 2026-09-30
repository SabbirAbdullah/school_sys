import 'package:equatable/equatable.dart';

abstract class DiaryEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDiary extends DiaryEvent {
  final DateTime date;

  LoadDiary(this.date);

  @override
  List<Object?> get props => [date];
}
