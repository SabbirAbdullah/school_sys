import 'package:flutter/material.dart';
import 'package:school_sys/app/core/values/app_colors.dart';
// Adjust path to your AppColors

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColors.appBarColor,
      iconTheme: const IconThemeData(color: Colors.white),
      centerTitle: true,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
