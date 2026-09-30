import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:school_sys/app/core/values/app_colors.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../core/custom_appbar.dart';
import '../bloc/attendance_bloc.dart';
import '../bloc/attendance_event.dart';
import '../bloc/attendance_state.dart';
import '../widgets/attendance_list.dart';

class AttendanceScreen extends StatefulWidget {
  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {

  late AttendanceDataSource _attendanceDataSource;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AttendanceBloc()..add(LoadAttendanceEvent(month: DateTime.now(), filter: "All")),
      child: BlocBuilder<AttendanceBloc, AttendanceState>(
        builder: (context, state) {
          final dataSource = AttendanceDataSource(state.attendanceList);
          return Scaffold(
            backgroundColor: AppColors.pageBackground,
            appBar: CustomAppBar(title: 'Attendance'),
            body: Column(
              children: [
                // Summary Cards
               Padding(
                 padding: const EdgeInsets.all(12),
                 child: Row(
                      children: [
                        _summaryCard('Present', state.presentCount, Colors.blue),
                        SizedBox(width: 12,),
                        _summaryCard('Absent', state.absentCount, Colors.red),
                      ],
                    ),
               ),

                // Filter Row
             Expanded(
               child: Container(
                 color: Colors.white,
                 child:Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(left: 12.0,right: 12,bottom: 8,top: 8),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Expanded(child: Text('Attendance History',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12),)),
                           _monthPicker(context, state.selectedMonth),
                           SizedBox(width: 8),
                           _statusDropdown(context, state.selectedFilter),

                         ],
                       ),
                     ),

                     Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
                       child: Container(
                         padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 24),
                         decoration: BoxDecoration(
                           border: Border.all(color: Color(0xffCDE4FF)),
                           color: Color(0xffE9F3FF),
                           borderRadius: BorderRadius.circular(4),
                         ),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.spaceAround,
                           children: const [
                             Text(
                               'Date',
                               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                             ),
                             Text(
                               'Status',
                               style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                             ),
                           ],
                         ),
                       ),
                     ),
                     Expanded(
                       child: SingleChildScrollView(
                         scrollDirection: Axis.vertical,
                         child: DataTable(
                           dividerThickness: 0.5,
                           columnSpacing: 100, // increase space between columns
                           horizontalMargin: 60, // control side margins
                           headingRowHeight: 0,

                           columns: const [
                             DataColumn(label: SizedBox()),
                             DataColumn(label: SizedBox()),
                           ],
                           rows: state.attendanceList.map((item) {
                             final statusColor = item.status == "Present" ? Colors.blue : Colors.red;

                             return DataRow(
                               cells: [
                                 DataCell(
                                   Align(
                                     alignment: Alignment.centerLeft,
                                     child: Text(
                                       DateFormat('d MMM y').format(item.date),
                                       style: TextStyle(fontSize: 12),
                                     ),
                                   ),
                                 ),
                                 DataCell(
                                   Align(
                                     alignment: Alignment.centerLeft,
                                     child: Row(
                                       mainAxisSize: MainAxisSize.min,
                                       children: [
                                         Icon(Icons.circle, color: statusColor, size: 10),
                                         SizedBox(width: 4),
                                         Text(
                                           item.status,
                                           style: TextStyle(color: statusColor, fontSize: 12),
                                         ),
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             );
                           }).toList(),
                         ),
                       ),
                     ),


                   ],
                 ),
               ),
             )
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _summaryCard(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$count ",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                  TextSpan(
                    text: "Days",
                    style: TextStyle(
                      fontSize: 12,fontWeight: FontWeight.w600,
                      color: color,
                    ),
                  ),
                ],
              ),
            ),

            Text("$label this month",style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Colors.grey),),
          ],
        ),
      ),
    );
  }

  Widget _monthPicker(BuildContext context, DateTime selectedMonth) {
    return GestureDetector(
      onTap: () async {
        final selected = await showMonthPicker(
          context: context,
          initialDate: selectedMonth,
          firstDate: DateTime(DateTime.now().year - 1),
          lastDate: DateTime(DateTime.now().year + 1),
        );
        if (selected != null) {
          context.read<AttendanceBloc>().add(LoadAttendanceEvent(month: selected, filter: "All"));
        }
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration( borderRadius: BorderRadius.circular(20), color:Color(0x240052b9) ),
        child: Row(
          children: [
            Icon(Icons.calendar_today, size: 14,color: AppColors.appBarColor,),
            SizedBox(width: 8),
            Text(DateFormat('MMMM').format(selectedMonth,),style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: AppColors.appBarColor),),
          ],
        ),
      ),
    );
  }

  Widget _statusDropdown(BuildContext context, String selectedFilter) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.04,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0x240052b9),),
        child: DropdownButton<String>(

          isExpanded: true,padding: EdgeInsets.only(left: 16,right: 8),
          dropdownColor: Colors.white,icon: Icon(Icons.keyboard_arrow_down_outlined),
          underline: SizedBox.shrink(),
          // decoration: InputDecoration(
          //   focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.white),gapPadding: 2,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //   enabledBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Colors.white),gapPadding: 1,
          //     borderRadius: BorderRadius.circular(20),
          //   ),
          //
          // ),
          value: selectedFilter,
          onChanged: (value) {
            if (value != null) {
              context.read<AttendanceBloc>().add(LoadAttendanceEvent(
                  month: context.read<AttendanceBloc>().state.selectedMonth,
                  filter: value));
            }
          },
          items: ["All", "Present", "Absent"]
              .map((status) => DropdownMenuItem(value: status, child: Text(status,style: TextStyle(fontSize: 12,color: AppColors.appBarColor),)))
              .toList(),
        ),
      ),
    );
  }
}

