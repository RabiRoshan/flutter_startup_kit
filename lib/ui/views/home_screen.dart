import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../generated/l10n.dart';
import '../../router.dart';
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
        portrait: HomeViewMobilePortrait(
          onLogoutPressed: _logout,
          onUpdateDetailsPressed: _redirectToUpdateDetails,
        ),
        landscape: HomeViewMobileLandscape(
          onLogoutPressed: _logout,
          onUpdateDetailsPressed: _redirectToUpdateDetails,
        ),
      ),
    );
  }

  _logout() {
    BlocProvider.of<AuthBloc>(context).add(LogoutEvent());
  }

  _redirectToUpdateDetails() {
    Get.toNamed(EnterUserDetailRoute);
  }
}

class HomeViewMobilePortrait extends StatelessWidget {
  final Function onLogoutPressed;
  final Function onUpdateDetailsPressed;

  const HomeViewMobilePortrait(
      {Key key, this.onLogoutPressed, this.onUpdateDetailsPressed})
      : super(key: key);

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
              onUpdateDetailsPressed();
            },
          ),
          vSpace15,
          ButtonTwo(
            text: S.of(context).logout,
            onPressed: () {
              onLogoutPressed();
            },
          ),
        ],
      ),
    );
  }
}

class HomeViewMobileLandscape extends StatelessWidget {
  final Function onLogoutPressed;
  final Function onUpdateDetailsPressed;

  const HomeViewMobileLandscape(
      {Key key, this.onLogoutPressed, this.onUpdateDetailsPressed})
      : super(key: key);

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
              onUpdateDetailsPressed();
            },
          ),
          vSpace15,
          ButtonTwo(
            text: S.of(context).logout,
            onPressed: () {
              onLogoutPressed();
            },
          ),
        ],
      ),
    );
  }
}
