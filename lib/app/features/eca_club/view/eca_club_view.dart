import 'package:flutter/material.dart';

import '../../../core/custom_appbar.dart';

class EcaClubScreen extends StatelessWidget {
  const EcaClubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'ECA & Club'),
      body: Center(child: Text('ECA & Club Page')),
    );
  }
}
