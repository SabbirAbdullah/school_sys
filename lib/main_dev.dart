import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/features/authentication/view/login_view.dart';
import 'app/features/event_news/bloc/event_news_bloc.dart';
import 'app/features/event_news/bloc/event_news_event.dart';
import 'app/features/incident_report/bloc/incident_report_bloc.dart';
import 'app/features/incident_report/bloc/incident_report_event.dart';
import 'app/features/profile/bloc/profile_bloc.dart';
import 'app/features/welcome/bloc/auth_bloc.dart';

import 'app/features/welcome/views/welcome_page.dart';
import 'flavors/build_config.dart';
import 'flavors/env_config.dart';
import 'flavors/environment.dart';
import 'main.dart';

void main() {
  EnvConfig devConfig = EnvConfig(
    appName: "",
    baseUrl: "",
    shouldCollectCrashLog: true,
  );

  BuildConfig.instantiate(
    envType: Environment.DEVELOPMENT,
    envConfig: devConfig,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (_) => AuthBloc(),
        ),
        BlocProvider<StudentProfileBloc>(
          create: (_) => StudentProfileBloc(),
        ),
        BlocProvider(
          create: (_) => IncidentBloc()..add(LoadStaticIncidents()),
        ),
        BlocProvider(
          create: (_) => EventNewsBloc()..add(LoadEventNews()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'School System',
        home: LoginScreen(),
      ),
    );
  }
}
