import 'package:bloc/bloc.dart';


import 'form_event.dart';
import 'form_state.dart';

class ComplainFormBloc extends Bloc<ComplainFormEvent, ComplainFormState> {
  ComplainFormBloc() : super(ComplainFormState()) {
    on<DateChanged>((event, emit) {
      emit(state.copyWith(date:event.date));
    });

    on<ComplainTypeChanged>((event, emit) {
      emit(state.copyWith(complainType: event.type));
    });

    on<DescriptionChanged>((event, emit) {
      emit(state.copyWith(description: event.description));
    });

    on<ImagePicked>((event, emit) {
      emit(state.copyWith(image: event.image));
    });

    on<CheckboxToggled>((event, emit) {
      emit(state.copyWith(isChecked: event.isChecked));
    });

    on<SubmitComplain>((event, emit) async {
      if (!state.isChecked) {
        emit(state.copyWith(errorMessage: 'You must accept the terms'));
        return;
      }

      emit(state.copyWith(isSubmitting: true, errorMessage: ''));

      try {
        // Simulate a network call
        await Future.delayed(Duration(seconds: 2));
        emit(state.copyWith(isSubmitting: false, isSuccess: true));
      } catch (e) {
        emit(state.copyWith(isSubmitting: false, errorMessage: 'Submission failed'));
      }
    });
  }
}
