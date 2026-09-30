import '../model/fees_model.dart';

abstract class FeesState {}

class FeesInitial extends FeesState {}

class FeesLoaded extends FeesState {
  final List<FeesModel> feesList;

  FeesLoaded(this.feesList);
}
