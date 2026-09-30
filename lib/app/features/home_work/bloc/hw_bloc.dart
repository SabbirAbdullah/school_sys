

import 'package:bloc/bloc.dart';

import '../model/hw_model.dart';
import 'hw_event.dart';
import 'hw_state.dart';




class HomeWorkBloc extends Bloc<HomeWorkEvent, HomeWorkState> {
  HomeWorkBloc() : super(HomeWorkInitial()) {
    on<LoadHomeWork>(_onLoadHomeWork);
  }

  Future<void> _onLoadHomeWork(LoadHomeWork event, Emitter<HomeWorkState> emit) async {
    emit(HomeWorkLoading());

    try {
      // Simulate a fetch (replace with real API call)
      await Future.delayed(Duration(seconds: 1));
      List<HomeWorkModel> mockData = [
        HomeWorkModel(subject: "Physics", status: 'incomplete', description: "Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the"),
        HomeWorkModel(subject: "Bangla", status: 'complete', description: "Lorem Ipsum is simply dummy text of the printing andtypesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the"),
      ];

      emit(HomeWorkLoaded(mockData));
    } catch (e) {
      emit(HomeWorkError("Failed to load diary."));
    }
  }
}
