import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:statusbar/statusbar.dart';

import 'generated/l10n.dart';
import 'locator.dart';
import 'router.dart';
import 'services/auth_service.dart';
import 'utils/styles.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/login_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then(
    (_) => runApp(App()),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    StatusBar.color(accentColor);

    return MaterialApp(
      title: 'Rewart',
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      navigatorKey: Get.key,
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: Router.generateRoute,
      theme: ThemeData(
        primaryColor: accentColor,
        primaryTextTheme: Theme.of(context).textTheme.apply(
              bodyColor: textColor,
              displayColor: textColor,
            ),
      ),
      home: StreamBuilder(
        stream: getIt<AuthService>().isLoggedIn.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data == true ? HomeScreen() : LoginScreen();
          } else {
            //TODO add Splashscreen here if needed
            return Container(color: Colors.white);
          }
        },
      ),
    );
  }
}
