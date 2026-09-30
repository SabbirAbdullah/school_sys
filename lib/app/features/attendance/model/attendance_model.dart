// models/attendance_model.dart
class AttendanceModel {
  final DateTime date;
  final String status; // "Present" or "Absent"

  AttendanceModel({required this.date, required this.status});
}
