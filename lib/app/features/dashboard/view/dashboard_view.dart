import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:school_sys/app/features/fees/view/fees_view.dart';
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

/// iOS-style palette
class _IOS {
  static const background = Color(0xFFF2F2F7); // systemGroupedBackground
  static const card = Colors.white;
  static const blue = Color(0xFF007AFF); // systemBlue
  static const label = Color(0xFF000000);
  static const secondaryLabel = Color(0xFF8E8E93);
  static const separator = Color(0xFFE5E5EA);
}

class _MenuItem {
  final String label;
  final IconData icon;
  final Color color;
  final Widget Function() builder;
  const _MenuItem(this.label, this.icon, this.color, this.builder);
}

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Grid shortcuts
  static final List<_MenuItem> _shortcuts = [
    _MenuItem('Attendance', CupertinoIcons.check_mark_circled_solid,
        const Color(0xFF34C759), () => AttendanceScreen()),
    _MenuItem('E-Diary', CupertinoIcons.book_fill, const Color(0xFF007AFF),
            () => EDiaryScreen()),
    _MenuItem('Classwork', CupertinoIcons.pencil_circle_fill,
        const Color(0xFFFF9500), () => ClassWorkScreen()),
    _MenuItem('Homework', CupertinoIcons.doc_text_fill,
        const Color(0xFFAF52DE), () => HomeWorkScreen()),
    _MenuItem('Class Test', CupertinoIcons.square_list_fill,
        const Color(0xFFFF3B30), () => ClassTestScreen()),
    _MenuItem('Routine', CupertinoIcons.clock_fill, const Color(0xFF5AC8FA),
            () => ClassRoutineScreen()),
    _MenuItem('Calendar', CupertinoIcons.calendar, const Color(0xFFFF2D55),
            () => CalendarScreen()),
    _MenuItem('ECA & Club', CupertinoIcons.sportscourt_fill,
        const Color(0xFF5856D6), () => EcaClubScreen()),
  ];

  // Settings-style list
  static final List<_MenuItem> _more = [
    _MenuItem('Fees', CupertinoIcons.creditcard_fill, const Color(0xFF34C759),
            () => FeesScreen()),
    _MenuItem('Complain', CupertinoIcons.chat_bubble_2_fill,
        const Color(0xFFFF9500), () => Complain()),
    _MenuItem('Incident Report', CupertinoIcons.exclamationmark_triangle_fill,
        const Color(0xFFFF3B30), () => IncidentView()),
    _MenuItem('Profile', CupertinoIcons.person_crop_circle_fill,
        const Color(0xFF007AFF), () => StudentProfilePage()),
  ];

  void _open(BuildContext context, Widget Function() builder) {
    Navigator.push(context, CupertinoPageRoute(builder: (_) => builder()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => DashboardBloc()..add(LoadDashboardData()),
      child: Scaffold(
        backgroundColor: _IOS.background,
        body: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return const Center(child: CupertinoActivityIndicator(radius: 14));
            }
            if (state is DashboardError) {
              return Center(
                child: Text(state.message,
                    style: const TextStyle(color: _IOS.secondaryLabel)),
              );
            }
            if (state is DashboardLoaded) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(),
                slivers: [
                  CupertinoSliverRefreshControl(
                    onRefresh: () async =>
                        context.read<DashboardBloc>().add(LoadDashboardData()),
                  ),
                  SliverToBoxAdapter(
                    child: SafeArea(
                      bottom: false,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _Header(name: state.userName, context: context),
                            const SizedBox(height: 24),
                            _shortcutGrid(context),
                            const SizedBox(height: 28),
                            _sectionHeader(
                              'Recent updates',
                              action: 'See all',
                              onTap: () => _open(context, () => EventNewsPage()),
                            ),
                            const SizedBox(height: 8),
                            _updateCard(
                              title: 'Pohela Boishakh celebration 2025',
                              date: '14 April 2025',
                              onTap: () => _open(context, () => EventNewsPage()),
                            ),
                            const SizedBox(height: 28),
                            _sectionHeader('More'),
                            const SizedBox(height: 8),
                            _moreList(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  // ---------- Sections ----------

  Widget _sectionHeader(String title, {String? action, VoidCallback? onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(title,
              style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                  color: _IOS.label)),
          if (action != null)
            CupertinoButton(
              padding: EdgeInsets.zero,
              minSize: 0,
              onPressed: onTap,
              child: Text(action,
                  style: const TextStyle(fontSize: 15, color: _IOS.blue)),
            ),
        ],
      ),
    );
  }

  Widget _shortcutGrid(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      decoration: BoxDecoration(
        color: _IOS.card,
        borderRadius: BorderRadius.circular(20),
      ),
      child: GridView.count(
        crossAxisCount: 4,
        shrinkWrap: true,
        mainAxisSpacing: 16,
        childAspectRatio: 0.82,
        physics: const NeverScrollableScrollPhysics(),
        children: _shortcuts.map((item) {
          return _Pressable(
            onTap: () => _open(context, item.builder),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _IconTile(icon: item.icon, color: item.color, size: 52),
                const SizedBox(height: 8),
                Text(item.label,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _IOS.label)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _updateCard({
    required String title,
    required String date,
    required VoidCallback onTap,
  }) {
    return _Pressable(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: _IOS.card,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            const _IconTile(
                icon: CupertinoIcons.sparkles,
                color: Color(0xFFFF9500),
                size: 44),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: _IOS.label)),
                  const SizedBox(height: 3),
                  Text(date,
                      style: const TextStyle(
                          fontSize: 13, color: _IOS.secondaryLabel)),
                ],
              ),
            ),
            const Icon(CupertinoIcons.chevron_right,
                size: 16, color: Color(0xFFC7C7CC)),
          ],
        ),
      ),
    );
  }

  Widget _moreList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: _IOS.card,
        borderRadius: BorderRadius.circular(20),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          for (int i = 0; i < _more.length; i++) ...[
            _Pressable(
              onTap: () => _open(context, _more[i].builder),
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    _IconTile(
                        icon: _more[i].icon, color: _more[i].color, size: 32),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Text(_more[i].label,
                          style: const TextStyle(
                              fontSize: 16, color: _IOS.label)),
                    ),
                    const Icon(CupertinoIcons.chevron_right,
                        size: 16, color: Color(0xFFC7C7CC)),
                  ],
                ),
              ),
            ),
            if (i != _more.length - 1)
              const Padding(
                padding: EdgeInsets.only(left: 62),
                child: Divider(height: 0.5, thickness: 0.5, color: _IOS.separator),
              ),
          ],
        ],
      ),
    );
  }
}

// ---------- Header ----------

class _Header extends StatelessWidget {
  final String name;
  final BuildContext context;
  const _Header({required this.name, required this.context});

  @override
  Widget build(BuildContext _) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 26,
          backgroundImage: AssetImage('assets/images/Mask group.png'),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Welcome back',
                  style: TextStyle(fontSize: 14, color: _IOS.secondaryLabel)),
              Text(name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.5,
                      color: _IOS.label)),
            ],
          ),
        ),
        CupertinoButton(
          padding: EdgeInsets.zero,
          minSize: 36,
          onPressed: () {},
          child: Container(
            width: 36,
            height: 36,
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            child: const Icon(CupertinoIcons.bell_fill,
                size: 18, color: _IOS.blue),
          ),
        ),
      ],
    );
  }
}

// ---------- Reusable bits ----------

/// Rounded-square app-icon style tile (like iOS Settings)
class _IconTile extends StatelessWidget {
  final IconData icon;
  final Color color;
  final double size;
  const _IconTile(
      {required this.icon, required this.color, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size * 0.28),
      ),
      child: Icon(icon, color: Colors.white, size: size * 0.55),
    );
  }
}

/// Subtle iOS-style press fade
class _Pressable extends StatefulWidget {
  final Widget child;
  final VoidCallback onTap;
  const _Pressable({required this.child, required this.onTap});

  @override
  State<_Pressable> createState() => _PressableState();
}

class _PressableState extends State<_Pressable> {
  bool _down = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_) => setState(() => _down = true),
      onTapCancel: () => setState(() => _down = false),
      onTapUp: (_) => setState(() => _down = false),
      onTap: widget.onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 120),
        opacity: _down ? 0.5 : 1,
        child: widget.child,
      ),
    );
  }
}