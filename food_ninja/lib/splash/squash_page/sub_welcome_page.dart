import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_ninja/core/images/app_vectors.dart';
import 'package:food_ninja/splash/widgets/splash.dart';

class SubWelcomePage extends StatefulWidget {
  const SubWelcomePage({super.key});

  @override
  State<SubWelcomePage> createState() => _SubWelcomePageState();
}

class _SubWelcomePageState extends State<SubWelcomePage> {
  // @override
  // void initState() {
  //   super.initState();
  //   _dismissKeyBoard();
  // }

  // Future<void> _dismissKeyBoard() async {
  //   SystemChannels.textInput.invokeMethod('TextInput.hide');
  //   WidgetsBinding.instance.addPostFrameCallback((_) {
  //     FocusManager.instance.primaryFocus?.unfocus();
  //   });
  //   // FocusScope.of(context).requestFocus(FocusNode());
  // }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.light
        ? AppVectors.subWelcomeImage
        : AppVectors.darkSubWelcomeImage;
    const String title = "Food Ninja is Where Your\nComfort Food Lives";
    const String subTitle =
        "Enjoy a fast and smooth food delivery at\nyour doorstep";
    const String buttonName = "Next";
    void onPressed() {
      Navigator.pushNamedAndRemoveUntil(context, "/log_in", (route) => false);
    }

    return Scaffold(
      body: Splash(
          isDark: isDark,
          title: title,
          buttonName: buttonName,
          subTitle: subTitle,
          onPressed: onPressed),
    );
  }
}
