import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/custom_appbar.dart';
import '../../../core/values/app_colors.dart';
import '../bloc/bloc.dart';
import '../bloc/bloc_event.dart';
import '../bloc/bloc_state.dart';


class ClassRoutineScreen extends StatelessWidget {
  final List<String> days = ["SAT", "SUN", "MON", "TUE", "WED", "THU"];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ClassRoutineBloc()..add(LoadClassRoutine()),
      child: DefaultTabController(
        length: days.length,
        child: Scaffold(
          backgroundColor: AppColors.pageBackground,
          appBar: AppBar(

            iconTheme: const IconThemeData(color: Colors.white),
            centerTitle: true,
            elevation: 0,
            backgroundColor: AppColors.appBarColor,
            title: Text("Class Routine", style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),),
            bottom: TabBar(labelStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.white),
              indicatorColor: AppColors.appBarColor,
              tabAlignment: TabAlignment.values.last,
              isScrollable: true,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.grey.shade400,
              tabs: days.map((d) => Tab(text: d)).toList(),
            ),
          ),
          body: BlocBuilder<ClassRoutineBloc, ClassRoutineState>(
            builder: (context, state) {
              if (state is ClassRoutineLoading) {
                return Center(child: LoadingAnimationWidget.staggeredDotsWave(
                  color: AppColors.appBarColor,
                  size: 40,
                ));
              } else if (state is ClassRoutineLoaded) {
                return TabBarView(
                  children: days.map((day) {
                    final filtered = state.routines
                        .where((r) => r.dayName.toUpperCase() == day)
                        .toList();
                    if (filtered.isEmpty) {
                      return Center(child: Text("No routines for $day"));
                    }
                    return ListView.builder(
                      itemCount: filtered.length,
                      padding: const EdgeInsets.all(8),
                      itemBuilder: (context, index) {
                        final item = filtered[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0,top: 8,left: 16,right: 16),
                          child: ClassRoutineCardWidget(
                            period: "${item.slotName}",
                            subject: "${item.subjectName}",
                            teacher: "${item.teacherFname} ${item.teacherLname}",
                          ),
                        );
                      },
                    );
                  }).toList(),
                );
              } else if (state is ClassRoutineError) {
                return Center(child: Text(state.message));
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}


class ClassRoutineCardWidget extends StatelessWidget {
  final String period;
  final String subject;
  final String teacher;

  const ClassRoutineCardWidget({
    Key? key,
    required this.period,
    required this.subject,
    required this.teacher,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius:BorderRadius.circular(8) ,color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Text(
                period,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subject,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    teacher,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
