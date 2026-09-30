// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'app/features/welcome/presentation/bloc/auth_bloc.dart';
// import 'app/features/welcome/presentation/views/welcome/welcome_page.dart';
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(
//       providers: [
//         BlocProvider<AuthBloc>(
//           create: (_) => AuthBloc(),
//         ),
//       ],
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         title: 'School System',
//         home: const WelcomePage(),
//       ),
//     );
//   }
// }
