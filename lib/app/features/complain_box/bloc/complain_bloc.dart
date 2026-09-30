import 'package:bloc/bloc.dart';

import '../model/complain_model.dart';
import 'complain_event.dart';
import 'complain_state.dart';

class ComplainBloc extends Bloc<ComplainEvent, ComplainState> {


  ComplainBloc() : super(ComplainState()) {
    on<FetchComplains>(_onFetch);
    on<DeleteComplain>(_onDelete);
    on<ToggleExpandCard>(_onToggle);
  }

  void _onFetch(FetchComplains event, Emitter<ComplainState> emit) async {
    emit(state.copyWith(isLoading: true));
    try {
      final list = await ComplainRepository.getComplains();
      emit(state.copyWith(isLoading: false, complainList: list));
    } catch (e) {
      emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    }
  }

  void _onDelete(DeleteComplain event, Emitter<ComplainState> emit) async {
    await ComplainRepository.deleteComplain(event.id);
    add(FetchComplains());
  }

  void _onToggle(ToggleExpandCard event, Emitter<ComplainState> emit) {
    final expanded = Set<int>.from(state.expandedCardIds);
    if (expanded.contains(event.id)) {
      expanded.remove(event.id);
    } else {
      expanded.add(event.id);
    }
    emit(state.copyWith(expandedCardIds: expanded));
  }
}
