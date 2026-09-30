import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:school_sys/app/features/fees/view/fees_view.dart';
import '../../../core/values/app_colors.dart';
import '../../attendance/view/attendance_view.dart';
import '../../calendar/view/calendar_view.dart';
import '../../class_routine/view/class_routine_view.dart';
import '../../class_test/view/class_test_view.dart';
import '../../class_work/view/class_work_view.dart';
import '../../complain_box/view/complain_view.dart';
import '../../e_diary/view/e_diary_view.dart';
import '../../eca_club/view/eca_club_view.dart';
import '../../event_news/view/event_news_view.dart';
import '../../home_work/view/home_work_view.dart';
import '../../incident_report/view/incident_report_view.dart';
import '../../profile/view/profile_view.dart';
import '../bloc/dashboard_bloc.dart';
import '../bloc/dashboard_event.dart';
import '../bloc/dashboard_state.dart';
import 'package:sidebarx/sidebarx.dart';

class DashboardScreen extends StatelessWidget {
  final SidebarXController _controller =
      SidebarXController(selectedIndex: 0, extended: true);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(LoadDashboardData()),
      child: Scaffold(
        endDrawer: Drawer(
          backgroundColor: Colors.white,
          width: MediaQuery.of(context).size.width * .7,
          child: SizedBox(
            child: SidebarX(
              animationDuration: Duration(milliseconds: 1),
              controller: _controller,
              theme: SidebarXTheme(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                textStyle: const TextStyle(color: Colors.black),
                selectedTextStyle: const TextStyle(color: Colors.blue),
                itemTextPadding: const EdgeInsets.only(left: 20),
                selectedItemTextPadding: const EdgeInsets.only(left: 20),
                itemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                selectedItemDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blue.shade100,
                ),
                iconTheme: const IconThemeData(color: Colors.grey),
                selectedIconTheme: const IconThemeData(color: Colors.blue),
              ),
              showToggleButton: false,
              toggleButtonBuilder: (context, extended) {
                return GestureDetector(
                  onTap: () {
                    _controller.setExtended(!extended);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(
                      extended ? Icons.arrow_back_ios_new : Icons.menu,
                      color: Colors.blue,
                      size: 20,
                    ),
                  ),
                );
              },
              items: [
                SidebarXItem(
                  icon: Icons.dashboard,
                  label: 'Dashboard',
                ),
                SidebarXItem(
                  icon: Icons.money,
                  label: 'Fees',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FeesScreen(),
                      ),
                    );
                  },
                ),
                SidebarXItem(
                  icon: Icons.dashboard,
                  label: 'Complain',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Complain(),
                      ),
                    );
                  },
                ),
                SidebarXItem(
                  icon: Icons.dashboard,
                  label: 'Profile',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => StudentProfilePage(),
                      ),
                    );
                  },
                ),
                SidebarXItem(
                  icon: Icons.dashboard,
                  label: 'Incident Report',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => IncidentView(),
                      ),
                    );
                  },
                ),
                SidebarXItem(icon: Icons.settings, label: 'Settings'),
                SidebarXItem(icon: Icons.logout, label: 'Logout'),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          backgroundColor: Color(0xff0057B9),
          elevation: 0,
          toolbarHeight: 0,
        ),
        backgroundColor: Color(0xffEDF0F8),
        body: SafeArea(
          child: BlocBuilder<DashboardBloc, DashboardState>(
            builder: (context, state) {
              if (state is DashboardLoading) {
                return Center(
                  child: LoadingAnimationWidget.staggeredDotsWave(
                    color: AppColors.appBarColor,
                    size: 40,
                  ),
                );
              } else if (state is DashboardLoaded) {
                return Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeader(state.userName, state.userImage, context),
                        Padding(
                          padding:
                              EdgeInsets.only(left: 16, right: 16, top: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Recent Updates",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500)),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => EventNewsPage(),
                                      ),
                                    );
                                  },
                                  child: Text("See more",
                                      style: TextStyle(
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.blue))),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            height: 150,
                            width: 260,
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.white),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Pohela boisakh celebration 2025",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14),
                                ),
                                Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/calender date.png",
                                      scale: 4,
                                    ),
                                    SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      '14th April, 2025',
                                      style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        // _buildRecentUpdates(state.recentUpdates),
                      ],
                    ),
                  ],
                );
              } else if (state is DashboardError) {
                return Center(child: Text(state.message));
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }

  /// Sidebar widget

  Widget _buildHeader(String name, String imagePath, BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(35)),
              color: Color(0xff0057B9),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/Mask group.png"),
                  radius: 30,
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                    Text(name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600)),
                  ],
                ),
                Spacer(),
                Image.asset(
                  "assets/images/Group.png",
                  height: 20,
                  width: 20,
                ),
                SizedBox(width: 24),
                GestureDetector(
                  onTap: () {
                    Scaffold.of(context)
                        .openEndDrawer(); // opens sidebar drawer
                  },
                  child: Icon(Icons.menu, color: Colors.white),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          _buildIconsGrid(context),
        ],
      ),
    );
  }

  Widget _buildIconsGrid(BuildContext context) {
    final List<Map<String, dynamic>> items = [
      {
        'image': 'assets/images/attendance.png',
        'label': 'Attendance',
        'screen': AttendanceScreen()
      },
      {
        'image': 'assets/images/ediary.png',
        'label': 'E-Diary',
        'screen': EDiaryScreen()
      },
      {
        'image': 'assets/images/cw.png',
        'label': 'Classwork',
        'screen': ClassWorkScreen()
      },
      {
        'image': 'assets/images/homework.png',
        'label': 'Homework',
        'screen': HomeWorkScreen()
      },
      {
        'image': 'assets/images/ct.png',
        'label': 'Class Test',
        'screen': ClassTestScreen()
      },
      {
        'image': 'assets/images/classroutine.png',
        'label': 'Class Routine',
        'screen': ClassRoutineScreen()
      },
      {
        'image': 'assets/images/calendar.png',
        'label': 'Calendar',
        'screen': CalendarScreen()
      },
      {
        'image': 'assets/images/eca.png',
        'label': 'ECA & Club',
        'screen': EcaClubScreen()
      },
    ];

    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: items.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => item['screen']),
              );
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(item['image'],
                    width: 30, height: 30, fit: BoxFit.contain),
                SizedBox(height: 8),
                Text(item['label'],
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
