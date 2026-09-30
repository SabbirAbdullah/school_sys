

import 'package:bloc/bloc.dart';

import '../model/diary_model.dart';
import 'diary_event.dart';
import 'diary_state.dart';

class DiaryBloc extends Bloc<DiaryEvent, DiaryState> {
  DiaryBloc() : super(DiaryInitial()) {
    on<LoadDiary>(_onLoadDiary);
  }

  Future<void> _onLoadDiary(LoadDiary event, Emitter<DiaryState> emit) async {
    emit(DiaryLoading());

    try {
      // Simulate a fetch (replace with real API call)
      await Future.delayed(Duration(seconds: 1));
      List<DiaryModel> mockData = [
        DiaryModel(subject: "Physics", description: "Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the"),
        DiaryModel(subject: "Bangla", description: "Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the"),
      ];

      emit(DiaryLoaded(mockData));
    } catch (e) {
      emit(DiaryError("Failed to load diary."));
    }
  }
}
