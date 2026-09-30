import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../core/custom_appbar.dart';
import '../../../core/values/app_colors.dart';
import '../bloc/hw_bloc.dart';
import '../bloc/hw_event.dart';
import '../bloc/hw_state.dart';




class HomeWorkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeWorkBloc()..add(LoadHomeWork(DateTime.now())),
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        appBar: CustomAppBar(title: 'Class Work'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // EasyDateTimeLine
            Container(
              padding: EdgeInsets.only(bottom: 12),
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
                  context
                      .read<HomeWorkBloc>()
                      .add(LoadHomeWork(selectedDate));
                },
                activeColor: AppColors.appBarColor,
                headerProps: EasyHeaderProps(
                  selectedDateStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  monthPickerType: MonthPickerType.switcher,

                  monthStyle:
                  TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
                  selectedDateFormat: SelectedDateFormat.fullDateDMonthAsStrY,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, top: 12, right: 12, bottom: 12),
              child: Text(
                'Diary List',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Colors.grey),
              ),
            ),
            // Diary List
            Expanded(
              child: BlocBuilder<HomeWorkBloc, HomeWorkState>(
                builder: (context, state) {
                  if (state is HomeWorkLoading) {
                    return Center(child:LoadingAnimationWidget.staggeredDotsWave(color: AppColors.appBarColor, size: 40) );
                  } else if (state is HomeWorkLoaded) {
                    if (state.diaries.isEmpty) {
                      return Center(child: Text("No diary entries."));
                    }
                    return ListView.builder(
                      itemCount: state.diaries.length,
                      itemBuilder: (_, index) {
                        final item = state.diaries[index];
                        return Padding(
                          padding: EdgeInsets.only(
                              bottom: 10.0, left: 12, right: 12),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Padding(
                              padding: EdgeInsets.all(12.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/e-book.png',
                                    color: AppColors.appBarColor,
                                    height: 15,
                                  ),
                                  SizedBox(
                                    width: 6,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(item.subject,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 12)),
                                        SizedBox(height: 6),
                                        Text(
                                          item.description,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: AppColors.grayColor),
                                        ),
                                        SizedBox(height: 6,),
                                        item.status == 'incomplete'
                                            ? Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.grey,
                                              size: 15,
                                            ),
                                            SizedBox(width: 6,),
                                            Text('Incomplete',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color: Colors.grey),)
                                          ],
                                        )
                                            : Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                              size: 15,
                                            ),
                                            SizedBox(width: 6,),
                                            Text('Complete',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w500,color:AppColors.appBarColor),)
                                          ],
                                        )
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
                  } else if (state is HomeWorkError) {
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
