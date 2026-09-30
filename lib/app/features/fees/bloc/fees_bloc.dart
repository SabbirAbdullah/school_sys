import 'package:bloc/bloc.dart';

import '../model/fees_model.dart';
import 'fees_event.dart';
import 'fees_state.dart';

class FeesBloc extends Bloc<FeesEvent, FeesState> {
  FeesBloc() : super(FeesInitial()) {
    on<LoadStaticFeesEvent>((event, emit) {
      final staticFees = [
        FeesModel(
          amount: "5000",
          balance: "0",
          feesType: "Tuition Fee",
          feesMonth: "04",
          dueDate: "2025-05-15",
        ),
        FeesModel(
          amount: "3000",
          balance: "1000",
          feesType: "Library Fee",
          feesMonth: "Null",
          dueDate: "2025-05-20",
        ),
      ];
      emit(FeesLoaded(staticFees));
    });
  }
}
