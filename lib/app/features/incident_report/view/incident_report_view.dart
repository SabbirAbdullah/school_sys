import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/core/custom_appbar.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/url.dart';
import '../bloc/incident_report_bloc.dart';
import '../bloc/incident_report_state.dart';
import '../model/incident_report_model.dart';

class IncidentView extends StatelessWidget {
  const IncidentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar: CustomAppBar(title: 'Incident Reports'),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocBuilder<IncidentBloc, IncidentState>(
          builder: (context, state) {
            if (state is IncidentLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is IncidentLoaded) {
              if (state.incidents.isEmpty) {
                return const Center(child: Text('No incidents found.'));
              }
              return ListView.builder(
                itemCount: state.incidents.length,
                itemBuilder: (context, index) {
                  final incident = state.incidents[index];
                  final imageUrl = incident.media != null
                      ? "${AppUrl.baseImageUrl}${incident.media}"
                      : null;

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                      ),
                      child: ListTile(

                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) =>
                                  IncidentDetailPage(incident: incident),
                            ),
                          );
                        },
                        leading: imageUrl != null
                            ? Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                            : Container(width: 50, height: 50, color: Colors.grey[300]),
                        title: Text(incident.eventDetails,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),),
                        subtitle: Text(
                          'Date: ${incident.dateOfOccurrence.split('T').first.split('-').reversed.join('-')}',
                          style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.grey),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const Center(child: Text('Something went wrong.'));
          },
        ),
      ),
    );
  }
}


class IncidentDetailPage extends StatelessWidget {
  final IncidentReportModel incident;

  const IncidentDetailPage({super.key, required this.incident});

  @override
  Widget build(BuildContext context) {
    final imageUrl = incident.media != null
        ? "${AppUrl.baseImageUrl}${incident.media}"
        : null;

    return Scaffold(
      backgroundColor: AppColors.pageBackground,
      appBar:CustomAppBar(title: 'Incident Details'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // Image Section
            imageUrl != null
                ? Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            )
                : Container(
              width: double.infinity,
              height: 200,
              color: Colors.grey[300],
              child: const Center(child: Text('No Image')),
            ),

            // Details Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  _buildDetailBlock('Event Details', incident.eventDetails),
                  _buildDetailBlock(
                    'Date of Occurrence',
                    incident.dateOfOccurrence.split('T').first,
                  ),
                  _buildDetailBlock(
                    'Course of Action',
                    incident.courseOfAction ?? 'No course of action',
                  ),
                  _buildDetailBlock(
                    'Counselor',
                    incident.counselorName ?? 'No counselor name',
                  ),
                  _buildDetailBlock(
                    'Class & Section',
                    '${incident.studentClass ?? ''} - ${incident.section ?? ''}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailBlock(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14)),
          const SizedBox(height: 8),
          Text(value,style: TextStyle(fontWeight: FontWeight.w400,fontSize: 12)),
        ],
      ),
    );
  }
}

