import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/core/custom_appbar.dart';
import 'package:school_sys/app/core/values/app_colors.dart';

import '../bloc/diary_bloc.dart';
import '../bloc/diary_event.dart';
import '../bloc/diary_state.dart';

class EDiaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DiaryBloc()..add(LoadDiary(DateTime.now())),
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        appBar: CustomAppBar(title: 'E-Diary'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EasyDateTimeLine
             Container(
               padding: EdgeInsets.only(bottom: 8),
                color: Colors.white,
                child: EasyDateTimeLine(

                  dayProps: EasyDayProps(
                    height: 72,
                    width: 52,
                    dayStructure: DayStructure.dayStrDayNum,
                    todayHighlightStyle: TodayHighlightStyle.withBackground,
                    activeDayStyle: DayStyle(

                      dayStrStyle: TextStyle(

                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                      dayNumStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      monthStrStyle: TextStyle(
                        color: Colors.transparent,
                        fontSize: 0,
                      ),
                    ),
                    inactiveDayStyle: DayStyle(
                      dayStrStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 11,
                      ),
                      dayNumStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      monthStrStyle: TextStyle(
                        color: Colors.transparent,
                        fontSize: 0,
                      ),
                    ),
                  ),
                  initialDate: DateTime.now(),
                  onDateChange: (selectedDate) {
                    context.read<DiaryBloc>().add(LoadDiary(selectedDate));
                  },
                  activeColor: AppColors.appBarColor,

                  headerProps: EasyHeaderProps(
                    selectedDateStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                    monthPickerType: MonthPickerType.switcher,monthStyle: TextStyle(fontWeight: FontWeight.w500,fontSize: 14),
                    selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0,top: 12,right: 12,bottom: 12),
              child: Text('Diary List',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 14,color: Colors.grey),),
            ),
            // Diary List
            Expanded(
              child: BlocBuilder<DiaryBloc, DiaryState>(
                builder: (context, state) {
                  if (state is DiaryLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is DiaryLoaded) {
                    if (state.diaries.isEmpty) {
                      return Center(child: Text("No diary entries."));
                    }
                    return ListView.builder(
                      itemCount: state.diaries.length,
                      itemBuilder: (_, index) {
                        final item = state.diaries[index];
                        return Padding(
                          padding:  EdgeInsets.only(bottom: 10.0,left: 12,right: 12),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                            child: Padding(
                              padding:  EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset('assets/images/e-book.png',color: AppColors.appBarColor,height: 15,),
                                  SizedBox(width: 6,),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(item.subject, style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12)),
                                        SizedBox(height: 6),
                                        Text(item.description,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.grayColor),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is DiaryError) {
                    return Center(child: Text(state.message));
                  }
                  return SizedBox.shrink();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

// class DiaryCard extends StatelessWidget {
//   final DiaryModel diary;
//
//   const DiaryCard({required this.diary});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       margin: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.menu_book_outlined, size: 18, color: Colors.blue),
//                 SizedBox(width: 8),
//                 Text(diary.subject, style: TextStyle(fontWeight: FontWeight.bold)),
//               ],
//             ),
//             SizedBox(height: 6),
//             Text(diary.description, style: TextStyle(fontSize: 14)),
//           ],
//         ),
//       ),
//     );
//   }
// }
