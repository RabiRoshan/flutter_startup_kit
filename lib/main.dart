import 'package:device_preview/device_preview.dart' as devicePreview;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'generated/l10n.dart';
import 'locator.dart';
import 'router.dart';
import 'services/auth_service.dart';
import 'ui/views/home_screen.dart';
import 'ui/views/login_screen.dart';
import 'utils/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

// Change to true to use fake api
  setupLocator(useFakeApi: false);

  // Lock device orientation here if needed
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).then(
    (_) => runApp(
      // TODO: Remove device preview on build
      devicePreview.DevicePreview(
        // enabled: !kReleaseMode,
        enabled: false,
        builder: (BuildContext context) {
          return App();
        },
      ),
    ),
  );

  // To make only bottom bar enabled and status bar hidded
  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

  // To set the color of status bar
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: appAccentColor,
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // TODO: Remove on build
      locale: devicePreview.DevicePreview.of(context)
          .locale, // <--- remove the locale
      // TODO: Remove on build
      builder: devicePreview.DevicePreview.appBuilder, // <--- remove

      debugShowCheckedModeBanner: false,

      title: 'Flutter Startup Kit',

      // Localization Config:
      // More details on
      // https://flutter.dev/docs/development/accessibility-and-localization/internationalization
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,

      // Navigator key to use Get.
      // More info on: https://pub.dev/packages/get
      navigatorKey: Get.key,

      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primarySwatch: appCustomColor,
      ),

      // check if logged in and show appropriate home
      home: StreamBuilder(
        stream: getIt<AuthService>().isLoggedIn.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data == true ? HomeScreen() : LoginScreen();
          } else {
            // Show loading indicator until AuthService is initialized
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
