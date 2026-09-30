// bloc/attendance_state.dart
import '../model/attendance_model.dart';


class AttendanceState {
  final List<AttendanceModel> attendanceList;
  final int presentCount;
  final int absentCount;
  final DateTime selectedMonth;
  final String selectedFilter;

  AttendanceState({
    required this.attendanceList,
    required this.presentCount,
    required this.absentCount,
    required this.selectedMonth,
    required this.selectedFilter,
  });

  AttendanceState copyWith({
    List<AttendanceModel>? attendanceList,
    int? presentCount,
    int? absentCount,
    DateTime? selectedMonth,
    String? selectedFilter,
  }) {
    return AttendanceState(
      attendanceList: attendanceList ?? this.attendanceList,
      presentCount: presentCount ?? this.presentCount,
      absentCount: absentCount ?? this.absentCount,
      selectedMonth: selectedMonth ?? this.selectedMonth,
      selectedFilter: selectedFilter ?? this.selectedFilter,
    );
  }
}
