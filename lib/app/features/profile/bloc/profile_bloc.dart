import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/features/profile/bloc/profile_state.dart';


class StudentProfileBloc extends Cubit<StudentProfileState> {
  StudentProfileBloc()
      : super(const StudentProfileState(
    firstName: 'Rahim',
    lastName: 'Uddin',
    imageUrl: 'assets/images/Mask group.png',
    studentId: 'ID12345',
    studentClass: '10',
    section: 'A',
  ));
}
