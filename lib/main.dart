import 'package:device_preview/device_preview.dart' as devicePreview;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'constants/app_constants.dart';
import 'generated/l10n.dart';
import 'locator.dart';
import 'router.dart';
import 'services/auth_service.dart';
import 'ui/views/home_screen.dart';
import 'ui/views/login_screen.dart';
import 'utils/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupLocator();

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

  SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: appAccentColor,
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Startup Kit',
      debugShowCheckedModeBanner: false,
      // TODO: Remove on build
      locale: devicePreview.DevicePreview.of(context)
          .locale, // <--- remove the locale
      // TODO: Remove on build
      builder: devicePreview.DevicePreview.appBuilder, // <--- remove
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        DefaultCupertinoLocalizations.delegate,
      ],
      navigatorKey: Get.key,
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primarySwatch: appCustomColor,
      ),
      home: StreamBuilder(
        stream: getIt<AuthService>().isLoggedIn.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data == true ? HomeScreen() : LoginScreen();
          } else {
            //TODO: Splashscreen
            return Scaffold(
              body: Center(
                child: Image.asset(LocalImages.flutterLogo),
              ),
            );
          }
        },
      ),
    );
  }
}
