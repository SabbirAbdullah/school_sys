import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/incident_report_model.dart';
import 'incident_report_event.dart';
import 'incident_report_state.dart';

class IncidentBloc extends Bloc<IncidentEvent, IncidentState> {
  IncidentBloc() : super(IncidentLoading()) {
    on<LoadStaticIncidents>((event, emit) {
      // Simulated static data
      final data = [
        IncidentReportModel(
          media: null,
          eventDetails: "Fought in class",
          dateOfOccurrence: "2025-05-01T00:00:00",
          courseOfAction: "Spoken to by counselor",
          counselorName: "Mr. Rahman",
          studentClass: "10",
          section: "A",
        ),
        IncidentReportModel(
          media: null,
          eventDetails: "Late to school",
          dateOfOccurrence: "2025-05-02T00:00:00",
          courseOfAction: "Parent called",
          counselorName: "Ms. Hossain",
          studentClass: "10",
          section: "A",
        ),
      ];

      emit(IncidentLoaded(data));
    });
  }
}
