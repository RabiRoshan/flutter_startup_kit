import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../services/auth_service.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Buttons.dart';
import 'base_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrientationLayout(
        portrait: HomeViewMobilePortrait(),
        landscape: HomeViewMobileLandscape(),
      ),
    );
  }
}

class HomeViewMobilePortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      padding: const EdgeInsets.all(
        30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Mobile Portrait Mode",
            style: tinyTextOneAppPrimaryColorBold,
            textAlign: TextAlign.center,
          ),
          vSpace10,
          Text(
            "${S.of(context).welcome}",
            style: largeTextTwoTextPrimaryColorBold,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          vSpace15,
          ButtonTwo(
            text: S.of(context).updateDetails,
            onPressed: () {
              Get.toNamed(EnterUserDetailRoute);
            },
          ),
          vSpace15,
          ButtonTwo(
            text: S.of(context).logout,
            onPressed: () {
              getIt<AuthService>().logout();
            },
          ),
        ],
      ),
    );
  }
}

class HomeViewMobileLandscape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      padding: const EdgeInsets.all(
        30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Mobile Landscape Mode",
            style: tinyTextOneAppPrimaryColorBold,
            textAlign: TextAlign.center,
          ),
          vSpace10,
          Text(
            "${S.of(context).welcome} Mobile Landscape Mode",
            style: largeTextTwoTextPrimaryColorBold,
            softWrap: true,
            textAlign: TextAlign.center,
          ),
          vSpace15,
          ButtonTwo(
            text: S.of(context).updateDetails,
            onPressed: () {
              Get.toNamed(EnterUserDetailRoute);
            },
          ),
          vSpace15,
          ButtonTwo(
            text: S.of(context).logout,
            onPressed: () {
              getIt<AuthService>().logout();
            },
          ),
        ],
      ),
    );
  }
}
