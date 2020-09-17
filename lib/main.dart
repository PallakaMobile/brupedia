import 'package:brupedia/blocs/dictionary/dictionary_bloc.dart';
import 'package:brupedia/di/di.dart';
import 'package:brupedia/pages/splashscreen/splash_screen_page.dart';
import 'package:brupedia/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:oktoast/oktoast.dart';

void main() async {
  serviceLocator();

/*  Crashlytics.instance.enableInDevMode = true;
  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;*/

  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(debug: true);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (BuildContext context, Widget child) {
          final MediaQueryData data = MediaQuery.of(context);
          return MediaQuery(
            data:
                data.copyWith(textScaleFactor: 1, alwaysUse24HourFormat: true),
            child: child,
          );
        },
        title: Strings.appName,
        theme: themeDefault,
        home: BlocProvider(
          create: (context) => DictionaryBloc(),
          child: SplashScreenPage(),
        ),
      ),
    );
  }
}
