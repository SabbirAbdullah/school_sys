import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/values/app_colors.dart';
import '../../../core/values/app_values.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';

class StudentProfilePage extends StatefulWidget {
  const StudentProfilePage({Key? key}) : super(key: key);

  @override
  State<StudentProfilePage> createState() => _StudentProfilePageState();
}

class _StudentProfilePageState extends State<StudentProfilePage>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileBloc, StudentProfileState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 2,
          child: Scaffold(
            backgroundColor: AppColors.pageBackground,
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.appBarColor,
              elevation: 1,
              toolbarHeight: 0,
            ),
            body: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                      ),
                      color: AppColors.appBarColor),
                  padding: const EdgeInsets.only(left: 12, right: 12, top: 12),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage(state.imageUrl),
                          ),
                          const SizedBox(width: 16),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${state.firstName} ${state.lastName}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: AppColors.textColorWhite,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    _buildInfoChip(
                                        state.studentId, Colors.blue.shade100),
                                    const SizedBox(width: 6),
                                    _buildInfoChip(state.studentClass,
                                        Colors.red.shade100),
                                    const SizedBox(width: 6),
                                    _buildInfoChip(
                                        state.section, Colors.green.shade100),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.white,
                        dividerHeight: 0,
                        dividerColor: AppColors.pageBackground,
                        unselectedLabelColor: Colors.grey.shade500,
                        indicator: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.white,
                              width: 2,
                            ),
                          ),
                        ),
                        tabs: const [
                          Tab(text: "Basic Info"),
                          Tab(text: "Contact Info"),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          offset: const Offset(0, 3),
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                      color: AppColors.pageBackground,
                    ),
                    child: TabBarView(
                      controller: _tabController,
                      children: const [
                        BasicInfoWidget(),
                        ContactInfoWidget(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoChip(String text, Color color) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 10,
          color: Colors.black,
        ),
      ),
    );
  }
}

class BasicInfoWidget extends StatelessWidget {
  const BasicInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentProfileBloc, StudentProfileState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.white),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Full Name",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      Text(
                        "${state.firstName} ${state.lastName}",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                    ],
                  ),
                ),

              InfoCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Class",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    Text(state.studentClass,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12)),
                  ],
                ),
              ),

              InfoCard(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Section",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                    Text(state.section,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 12)),
                  ],
                ),
              ),

                InfoCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Class",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                      ),
                      Text(state.studentClass,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12)),
                    ],
                  ),
                ),

                InfoCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Section",
                        style: TextStyle(fontWeight: FontWeight.w600,fontSize: 12,),
                      ),
                      Text(state.section,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 12)),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}

class ContactInfoWidget extends StatelessWidget {
  const ContactInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // You can also get these from the Bloc later if needed
    const phone = "01712345678";
    const email = "rahim.uddin@student.edu";

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            InfoCard(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Phone",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Text(phone,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            )),
            InfoCard(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Email",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Text(email,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12)),
              ],
            )),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final Widget child;
  const InfoCard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  child: child,
                ),
                SizedBox(height: 6,),
                DottedLine(dashColor: AppColors.borderColor,),
                SizedBox(height: 12,),
              ],
            ));
  }
}
