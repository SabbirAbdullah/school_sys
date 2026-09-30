import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<UserTypeChanged>((event, emit) {
      emit(state.copyWith(userType: event.userType));
    });

    on<LoginCredentialsChanged>((event, emit) {
      emit(state.copyWith(studentId: event.studentId, password: event.password));
    });

    on<RememberMeToggled>((event, emit) {
      emit(state.copyWith(rememberMe: !state.rememberMe));
    });

    on<SubmitLogin>((event, emit) async {
      emit(state.copyWith(isSubmitting: true, error: null));
      // Simulate login delay
      await Future.delayed(Duration(seconds: 2));

      if (state.studentId.isEmpty || state.password.isEmpty) {
        emit(state.copyWith(isSubmitting: false, error: "Please fill in all fields"));
      } else {
        emit(state.copyWith(isSubmitting: false));
        // Navigate or call success handler
      }
    });

    on<LoginPasswordVisibilityToggled>((event, emit) {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    });

  }
}
