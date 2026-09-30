import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';


class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<StudentLoginSelected>((event, emit) {
      emit(AuthStudentLoginState());
    });

    on<ParentLoginSelected>((event, emit) {
      emit(AuthParentLoginState());
    });
  }
}
