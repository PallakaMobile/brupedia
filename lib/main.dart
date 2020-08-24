import 'package:brupedia/di/di.dart';
import 'package:brupedia/pages/pages.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  serviceLocator();

/*  Crashlytics.instance.enableInDevMode = true;
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;*/

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (BuildContext context, Widget child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data:
              data.copyWith(textScaleFactor: 1.0, alwaysUse24HourFormat: true),
          child: child,
        );
      },
      title: Strings.appName,
      theme: themeDefault,
      home: SplashScreenPage(),
    );
  }
}