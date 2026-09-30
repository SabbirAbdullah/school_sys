// import 'package:flutter/material.dart';
// import 'app_router.dart'; // You’ll create this
//
// class MyApp extends StatelessWidget {
//   final EnvConfig _envConfig = BuildConfig.instance.config;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: _envConfig.appName,
//       routerConfig: AppRouter().router, // ✅ Use GoRouter or custom config
//       supportedLocales: const [Locale('en'), Locale('bn')],
//       theme: ThemeData(
//         appBarTheme: AppBarTheme(
//           backgroundColor: AppColors.appBarColor,
//           titleTextStyle: TextStyle(
//               color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
//           iconTheme: IconThemeData(color: Colors.white),
//         ),
//         primarySwatch: AppColors.colorPrimarySwatch,
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//         brightness: Brightness.light,
//         primaryColor: AppColors.colorPrimary,
//         textTheme: const TextTheme(
//           labelLarge: TextStyle(
//             color: Colors.white,
//             fontSize: 14.0,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         fontFamily: 'Roboto',
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
