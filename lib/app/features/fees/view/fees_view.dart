import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/core/custom_appbar.dart';
import 'package:school_sys/app/core/values/app_colors.dart';

import '../../../core/values/app_values.dart';
import '../../../core/values/text_styles.dart';
import '../bloc/fees_bloc.dart';
import '../bloc/fees_event.dart';
import '../bloc/fees_state.dart';
import '../model/fees_model.dart';

class FeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FeesBloc()..add(LoadStaticFeesEvent()),
      child: Scaffold(
        backgroundColor: AppColors.pageBackground,
        appBar: CustomAppBar(title: 'Fees Details'),
        body: BlocBuilder<FeesBloc, FeesState>(
          builder: (context, state) {
            if (state is FeesLoaded) {
              return ListView.builder(
                itemCount: state.feesList.length,
                itemBuilder: (_, index) {
                  return buildFeesCard(state.feesList[index]);
                },
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
  String getMonthName(String monthNumber) {
    switch (monthNumber) {
      case '01':
      case '1':
        return 'January';
      case '02':
      case '2':
        return 'February';
      case '03':
      case '3':
        return 'March';
      case '04':
      case '4':
        return 'April';
      case '05':
      case '5':
        return 'May';
      case '06':
      case '6':
        return 'June';
      case '07':
      case '7':
        return 'July';
      case '08':
      case '8':
        return 'August';
      case '09':
      case '9':
        return 'September';
      case '10':
        return 'October';
      case '11':
        return 'November';
      case '12':
        return 'December';
      default:
        return 'Unknown';
    }
  }

  Widget buildFeesCard(FeesModel dataModel) {
    return Padding(
      padding:  EdgeInsets.only(top: 8,left: 16,bottom: 8,right: 16),
      child: Container(
        decoration: boxDecorationStyle,
        child: Padding(
          padding: const EdgeInsets.all(AppValues.padding_2),
          child: ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    dataModel.balance == "0"
                        ? Text("৳ ${dataModel.amount}", style: greenAmountStyle)
                        : Row(
                      children: [
                        Text("৳ ${dataModel.amount}", style: greenAmountStyle),
                        Text("(Due: ${dataModel.balance})", style: redAmountStyle),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      decoration: BoxDecoration(
                        color: dataModel.balance == "0" ? Colors.green : Colors.red,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        dataModel.balance == "0" ? "Paid" : "Due",
                        style: TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    ),
                  ],
                ),
                Text("${dataModel.feesType}", style: TextStyle(fontSize: 12)),
              ],
            ),
            subtitle: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text("Fees Month: ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12)),
                Text(
                  dataModel.feesMonth == 'Null' ? 'N/A' : getMonthName(dataModel.feesMonth),
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 13),
                ),
                Text(", Due Date: ", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 12)),
                Text(
                  "${dataModel.dueDate}",
                  style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600, fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}


