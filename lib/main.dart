import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_ninja/core/themes/app_themes.dart';
import 'package:food_ninja/features/auth/sign_in_page.dart';
import 'package:food_ninja/features/auth/sign_up_page.dart';
import 'package:food_ninja/features/profile/complete_profile.dart';
import 'package:food_ninja/features/splash/second_splash_page.dart';
import 'package:food_ninja/features/splash/third_splash_page.dart';
import 'package:food_ninja/features/splash/welcome_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Supabase.initialize(
    url: dotenv.env['PROJECT_URL']!,
    anonKey: dotenv.env['ACCESS_KEY']!,
  );
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: AppThemes.darkTheme,
      theme: AppThemes.darkTheme,
      home: const WelcomePage(),
      routes: {
        "/second_splash_page": (context) => const SecondSplashPage(),
        "/third_splash_page": (context) => const ThirdSplashPage(),
        "/sign_in": (context) => const SignInPage(),
        "/sign_up": (context) => SignUpPage(),
        "/complete_profile": (context) => CompleteProfile(),
      },
    );
  }
}
