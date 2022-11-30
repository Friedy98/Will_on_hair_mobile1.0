import 'dart:io';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Authentication/login_page.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown
  ]).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          !kIsWeb && Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'WillOnHair',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: AppTheme.textTheme,
        platform: TargetPlatform.iOS,
      ),
      home: _buildSplashScreen(context),
    );
  }

  Widget _buildSplashScreen(BuildContext context) {

    return AnimatedSplashScreen.withScreenFunction(
      splash: Image.asset('assets/images/photo_2022-11-25_01-12-07.jpg'),
      duration: 4000,
      splashIconSize: double.infinity,
      screenFunction: () async{
        return LoginPage();
      },
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Colors.white,
      //pageTransitionType: PageTransitionType.scale,
    );
  }
}

class HexColor extends Color {
  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));

  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF' + hexColor;
    }
    return int.parse(hexColor, radix: 16);
  }
}
