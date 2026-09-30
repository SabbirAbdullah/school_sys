import 'package:equatable/equatable.dart';

abstract class HomeWorkEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadHomeWork extends HomeWorkEvent {
  final DateTime date;

  LoadHomeWork(this.date);

  @override
  List<Object?> get props => [date];
}
