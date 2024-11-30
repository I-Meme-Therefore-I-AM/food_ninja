import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_ninja/auth/bloc/auth_bloc_bloc.dart';
import 'package:food_ninja/auth/bloc/user_update_bloc.dart';
import 'package:food_ninja/auth/pages/bio_form.dart';
import 'package:food_ninja/auth/pages/log_in_page.dart';
import 'package:food_ninja/auth/pages/sign_up_page.dart';
import 'package:food_ninja/core/themes/app_themes.dart';
import 'package:food_ninja/core/themes/bloc/theme_bloc.dart';
import 'package:food_ninja/service_locator.dart';
import 'package:food_ninja/splash/squash_page/on_boarding_page.dart';
import 'package:food_ninja/splash/squash_page/sub_welcome_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependecies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ThemeBloc()),
      BlocProvider(create: (_) => sl<AuthBlocBloc>()),
      BlocProvider(create: (_) => sl<UserUpdateBloc>()),
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
          initialRoute: "/",
          routes: {
            "/welcome_next": (context) => SubWelcomePage(),
            "/log_in": (context) => LogInPage(),
            "/sign_up": (context) => SignUpPage(),
            "/bio_form": (context) => BioForm(),
          },
        );
      },
    );
  }
}
