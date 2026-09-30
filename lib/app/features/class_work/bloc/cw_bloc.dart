

import 'package:bloc/bloc.dart';

import '../model/cw_model.dart';
import 'cw_event.dart';
import 'cw_state.dart';



class ClassWorkBloc extends Bloc<ClassWorkEvent, ClassWorkState> {
  ClassWorkBloc() : super(ClassWorkInitial()) {
    on<LoadClassWork>(_onLoadClassWork);
  }

  Future<void> _onLoadClassWork(LoadClassWork event, Emitter<ClassWorkState> emit) async {
    emit(ClassWorkLoading());

    try {
      // Simulate a fetch (replace with real API call)
      await Future.delayed(Duration(seconds: 1));
      List<ClassWorkModel> mockData = [
        ClassWorkModel(subject: "Physics", status: 'incomplete', description: "Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the"),
        ClassWorkModel(subject: "Bangla", status: 'complete', description: "Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the"),
      ];

      emit(ClassWorkLoaded(mockData));
    } catch (e) {
      emit(ClassWorkError("Failed to load diary."));
    }
  }
}
