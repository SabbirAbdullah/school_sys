// bloc/attendance_event.dart
abstract class AttendanceEvent {}

class LoadAttendanceEvent extends AttendanceEvent {
  final DateTime month;
  final String filter; // "All", "Present", "Absent"

  LoadAttendanceEvent({required this.month, required this.filter});
}
