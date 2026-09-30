import '../model/incident_report_model.dart';

abstract class IncidentState {}

class IncidentLoading extends IncidentState {}

class IncidentLoaded extends IncidentState {
  final List<IncidentReportModel> incidents;

  IncidentLoaded(this.incidents);
}
