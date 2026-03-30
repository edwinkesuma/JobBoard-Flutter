import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:job_board/core/di/injection_container.dart' as di;
import 'package:job_board/core/utils/router.dart';
import 'package:job_board/features/auth/presentation/bloc/auth_bloc.dart';

void main() async {
  await di.init();
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => di.sl<AuthBloc>())],
      child: MaterialApp.router(
        title: "Job Board",
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        // builder: ,
      ),
    );
  }
}
