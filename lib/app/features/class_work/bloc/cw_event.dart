import 'package:equatable/equatable.dart';

abstract class ClassWorkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadClassWork extends ClassWorkEvent {
  final DateTime date;

  LoadClassWork(this.date);

  @override
  List<Object?> get props => [date];
}
