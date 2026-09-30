import 'package:flutter/material.dart';
import 'package:school_sys/app/core/values/app_colors.dart';

import '../../../core/custom_appbar.dart';

import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'package:intl/intl.dart';


class CalendarScreen extends StatelessWidget {
  CalendarScreen({super.key});

  final List<AcademicEventModel> events = [
    AcademicEventModel(
      title: "Orientation Day",
      eventType: "Holiday",
      start: DateTime.now().add(Duration(days: 1, hours: 10)),
      end: DateTime.now().add(Duration(days: 2, hours: 12)),
      color: "#2196F3",
    ),
    AcademicEventModel(
      title: "Mid Term Exam",
      eventType: "Exam",
      start: DateTime.now().add(Duration(days: 5, hours: 9)),
      end: DateTime.now().add(Duration(days: 5, hours: 11)),
      color: "#FF9800",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  CustomAppBar(title: 'Calendar'),
      body: SfCalendar(
        backgroundColor:Colors.white,
        todayTextStyle: TextStyle(fontSize: 12),
        appointmentTextStyle: TextStyle(fontSize: 10,color: Colors.white),
        cellBorderColor: AppColors.borderColor,
        todayHighlightColor: AppColors.appBarColor,
        view: CalendarView.month,
        headerStyle: CalendarHeaderStyle(backgroundColor: Colors.white,textAlign: TextAlign.justify),
        headerHeight: 60,
        showNavigationArrow: true,
        showDatePickerButton: true,
        initialDisplayDate: DateTime.now(),
        selectionDecoration: BoxDecoration(
          // Change this color to your preferred selection color
          shape: BoxShape.rectangle,
          border: Border.all(color: AppColors.appBarColor),// Or BoxShape.circle for round selection
          borderRadius: BorderRadius.circular(8),
          // Optional, for rounded rectangle
        ),
        onTap: (details) {
          if (details.appointments != null && details.appointments!.isNotEmpty) {
            final tappedEvent = details.appointments!.first as AcademicEventModel;
            showModalBottomSheet(
              context: context,
              builder: (_) => EventDetailsBottomSheet(event: tappedEvent),
            );
          }
        },
        monthViewSettings: const MonthViewSettings(
          dayFormat: 'EEE',
          appointmentDisplayCount: 4,
          appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
        ),
        dataSource: EventDataSource(events),
      ),
    );
  }
}

class AcademicEventModel {
  final String title;
  final String eventType;
  final DateTime start;
  final DateTime end;
  final String color;

  AcademicEventModel({
    required this.title,
    required this.eventType,
    required this.start,
    required this.end,
    required this.color,
  });
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<AcademicEventModel> events) {
    appointments = events;
  }

  @override
  DateTime getStartTime(int index) => appointments![index].start;
  @override
  DateTime getEndTime(int index) => appointments![index].end;
  @override
  String getSubject(int index) => appointments![index].title;
  @override
  Color getColor(int index) => _fromHex(appointments![index].color);

  Color _fromHex(String hexColor) {
    final buffer = StringBuffer();
    if (hexColor.length == 6 || hexColor.length == 7) buffer.write('ff');
    buffer.write(hexColor.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}

class EventDetailsBottomSheet extends StatelessWidget {
  final AcademicEventModel event;

  const EventDetailsBottomSheet({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Wrap(
        children: [
          Center(
              child: Container(
                  height: 4,
                  width: 40,
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius: BorderRadius.circular(2)))),
          ListTile(
            title: Text(event.title,
                style:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            subtitle: Text("Event Type: ${event.eventType}"),
          ),
          ListTile(
            title: const Text("Start"),
            subtitle:
            Text(DateFormat('dd MMM yyyy, hh:mm a').format(event.start)),
          ),
          ListTile(
            title: const Text("End"),
            subtitle:
            Text(DateFormat('dd MMM yyyy, hh:mm a').format(event.end)),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
