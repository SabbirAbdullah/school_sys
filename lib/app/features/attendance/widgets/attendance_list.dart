import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../model/attendance_model.dart';

class AttendanceDataSource extends DataGridSource {
  List<DataGridRow> _attendanceRows = [];

  AttendanceDataSource(List<AttendanceModel> attendanceList) {
    _attendanceRows = attendanceList.map<DataGridRow>((item) {
      return DataGridRow(cells: [
        DataGridCell<String>(columnName: 'date', value: DateFormat('d MMM y').format(item.date)),
        DataGridCell<String>(columnName: 'status', value: item.status),
      ]);
    }).toList();
  }

  @override
  List<DataGridRow> get rows => _attendanceRows;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(cells: row.getCells().map<Widget>((cell) {
      final isStatus = cell.columnName == 'status';
      final isPresent = cell.value == "Present";
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: isStatus
              ? [
            Icon(Icons.circle, size: 8, color: isPresent ? Colors.blue : Colors.red),
            SizedBox(width: 4),
            Text(
              cell.value,
              style: TextStyle(color: isPresent ? Colors.blue : Colors.red),
            ),
          ]
              : [
            Text(cell.value.toString()),
          ],
        ),
      );
    }).toList());
  }
}
