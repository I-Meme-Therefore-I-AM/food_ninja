import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/core/themes/app_themes.dart';
import 'package:food_ninja/core/themes/bloc/theme_bloc.dart';
import 'package:food_ninja/splash/squash_page/on_boarding_page.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ThemeBloc()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeMode>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const OnBoardingPage(),
          theme: AppThemes.lightMode,
          themeMode: state,
          darkTheme: AppThemes.darkMode,
        );
      },
    );
  }
}
