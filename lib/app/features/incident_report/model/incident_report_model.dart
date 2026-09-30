class IncidentReportModel {
  final String? media;
  final String eventDetails;
  final String dateOfOccurrence;
  final String? courseOfAction;
  final String? counselorName;
  final String? studentClass;
  final String? section;

  IncidentReportModel({
    this.media,
    required this.eventDetails,
    required this.dateOfOccurrence,
    this.courseOfAction,
    this.counselorName,
    this.studentClass,
    this.section,
  });
}
