import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';
import 'package:reward_chain/ui/responsive/orientation_layout.dart';
import 'package:reward_chain/ui/responsive/screent_type_layout.dart';

import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../utils/styles.dart';
import '../view_models/login_view_model.dart';
import '../widgets/Buttons.dart';
import '../widgets/TextFields.dart';
import 'base_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: LoginViewMobilePortrait(),
          landscape: LoginViewMobileLandscape(),
        ),
      ),
    );
  }
}

class LoginViewMobilePortrait extends ProviderWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return BaseScreen(
      secureScreen: false,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            S.of(context).login,
            style: largeTextOneTextPrimaryColorReg,
          ),
          model.loginWithTouchId
              ? Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 67, vertical: 48),
                      decoration: BoxDecoration(
                        color: appAccentColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        LocalImages.fingerPrint,
                        height: 100,
                      ),
                    ),
                    vSpace30,
                    Text(
                      S.of(context).loginWith,
                      style: mediumTextOneTextPrimaryColorReg,
                    ),
                    Text(
                      S.of(context).touchId,
                      style: mediumTextOneAppPrimaryColorReg,
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFieldOne(
                        hintText: S.of(context).email,
                        controller: model.emailController,
                      ),
                    ),
                    vSpace15,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFieldOne(
                        hintText: S.of(context).password,
                        controller: model.passwordController,
                        obscureText: true,
                      ),
                    ),
                    vSpace15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTwo(
                          text: S.of(context).login,
                          showLoader: model.isLoading,
                          onPressed: () {
                            model.onLoginPressed(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonOne(
              text: model.loginWithTouchId
                  ? S.of(context).loginWithPassword
                  : S.of(context).loginWithTouchId,
              onPressed: () {
                model.changeLoginMode();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginViewMobileLandscape extends ProviderWidget<LoginViewModel> {
  @override
  Widget build(BuildContext context, model) {
    return BaseScreen(
      secureScreen: false,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          model.loginWithTouchId
              ? Column(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 67, vertical: 48),
                      decoration: BoxDecoration(
                        color: appAccentColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            30,
                          ),
                        ),
                      ),
                      child: Image.asset(
                        LocalImages.fingerPrint,
                        height: 50,
                      ),
                    ),
                    vSpace30,
                    Text(
                      S.of(context).loginWith,
                      style: mediumTextOneTextPrimaryColorReg,
                    ),
                    Text(
                      S.of(context).touchId,
                      style: mediumTextOneAppPrimaryColorReg,
                    ),
                  ],
                )
              : Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFieldOne(
                        hintText: S.of(context).email,
                        controller: model.emailController,
                      ),
                    ),
                    vSpace15,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFieldOne(
                        hintText: S.of(context).password,
                        controller: model.passwordController,
                        obscureText: true,
                      ),
                    ),
                    vSpace15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTwo(
                          text: S.of(context).login,
                          showLoader: model.isLoading,
                          onPressed: () {
                            model.onLoginPressed(context);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonOne(
              text: model.loginWithTouchId
                  ? S.of(context).loginWithPassword
                  : S.of(context).loginWithTouchId,
              onPressed: () {
                model.changeLoginMode();
              },
            ),
          ),
        ],
      ),
    );
  }
}
