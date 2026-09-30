import 'package:flutter/material.dart';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';

import 'package:animated_toggle_switch/animated_toggle_switch.dart';

class UserTypeToggle extends StatelessWidget {
  final String selected;
  final Function(String) onChanged;

  const UserTypeToggle({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,

      child: AnimatedToggleSwitch<String>.size(
        indicatorSize: Size(100, 40),
        selectedIconScale: 1,
        borderWidth: 5,
        current: selected,
        values: const ['Student', 'Parents'],
        onChanged: onChanged,
        iconBuilder: (value) => Center(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
        ),

        height: 50,
        style: ToggleStyle(
          backgroundColor: const Color(0xffEAECF2),
          indicatorColor: Colors.white,

          borderRadius: BorderRadius.circular(10),
          indicatorBorderRadius: BorderRadius.circular(8),
          borderColor: Colors.transparent,


        ),
      ),
    );
  }
}




