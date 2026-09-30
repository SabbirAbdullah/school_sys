import 'package:flutter/material.dart';

import '../../../core/custom_appbar.dart';

class ClassTestScreen extends StatelessWidget {
  const ClassTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Class Test'),
      body: Center(child: Text('Class Test Page')),
    );
  }
}
