// bloc/attendance_bloc.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/attendance_model.dart';
import 'attendance_event.dart';
import 'attendance_state.dart';


class AttendanceBloc extends Bloc<AttendanceEvent, AttendanceState> {
  AttendanceBloc()
      : super(AttendanceState(
    attendanceList: [],
    presentCount: 0,
    absentCount: 0,
    selectedMonth: DateTime.now(),
    selectedFilter: "All",
  )) {
    on<LoadAttendanceEvent>(_onLoadAttendance);
  }

  Future<void> _onLoadAttendance(LoadAttendanceEvent event, Emitter<AttendanceState> emit) async {
    // Normally you'd fetch from an API here
    final dummyData = _generateDummyData(event.month);

    List<AttendanceModel> filtered = dummyData;
    if (event.filter == "Present") {
      filtered = dummyData.where((e) => e.status == "Present").toList();
    } else if (event.filter == "Absent") {
      filtered = dummyData.where((e) => e.status == "Absent").toList();
    }

    final presentCount = dummyData.where((e) => e.status == "Present").length;
    final absentCount = dummyData.where((e) => e.status == "Absent").length;

    emit(AttendanceState(
      attendanceList: filtered,
      presentCount: presentCount,
      absentCount: absentCount,
      selectedMonth: event.month,
      selectedFilter: event.filter,
    ));
  }

  List<AttendanceModel> _generateDummyData(DateTime month) {
    final List<AttendanceModel> list = [];
    final int daysInMonth = DateUtils.getDaysInMonth(month.year, month.month);

    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime(month.year, month.month, i);
      final status = i % 4 == 0 ? "Absent" : "Present"; // Simulate pattern
      list.add(AttendanceModel(date: date, status: status));
    }
    return list;
  }
}
