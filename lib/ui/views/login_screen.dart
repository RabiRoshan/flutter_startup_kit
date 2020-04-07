import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../constants/app_constants.dart';
import '../../generated/l10n.dart';
import '../../router.dart';
import '../../utils/styles.dart';
import '../responsive/orientation_layout.dart';
import '../responsive/screent_type_layout.dart';
import '../widgets/Buttons.dart';
import '../widgets/TextFields.dart';
import 'base_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _loginWithTouchId = true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailedState) {
          Get.snackbar(S.of(context).loginError, state.error.error);
        } else if (state is AuthenticatedState) {
          Get.offAllNamed(HomeRoute);
        }
      },
      builder: (context, state) => ScreenTypeLayout(
        mobile: OrientationLayout(
          portrait: LoginViewMobilePortrait(
            emailController: emailController,
            passwordController: passwordController,
            loginWithTouchId: _loginWithTouchId,
            onSwithcLoginMethod: _switchLoginMethod,
            onLoginPressed: _login,
            isLoggingIn: state is AuthenticatingState ?? false,
          ),
          landscape: LoginViewMobileLandscape(
            emailController: emailController,
            passwordController: passwordController,
            loginWithTouchId: _loginWithTouchId,
            onSwithcLoginMethod: _switchLoginMethod,
            onLoginPressed: _login,
            isLoggingIn: state is AuthenticatingState ?? false,
          ),
        ),
      ),
    );
  }

  _switchLoginMethod() {
    setState(() {
      _loginWithTouchId = !_loginWithTouchId;
    });
  }

  _login() {
    BlocProvider.of<AuthBloc>(context).add(
      LoginEvent(
        emailController.text,
        passwordController.text,
      ),
    );
  }
}

class LoginViewMobilePortrait extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onSwithcLoginMethod;
  final bool loginWithTouchId;
  final Function onLoginPressed;
  final isLoggingIn;

  const LoginViewMobilePortrait(
      {Key key,
      this.emailController,
      this.passwordController,
      this.onSwithcLoginMethod,
      this.loginWithTouchId,
      this.onLoginPressed,
      this.isLoggingIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          loginWithTouchId
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
                        controller: emailController,
                      ),
                    ),
                    vSpace15,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFieldOne(
                        hintText: S.of(context).password,
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ),
                    vSpace15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTwo(
                          text: S.of(context).login,
                          showLoader: isLoggingIn,
                          onPressed: () {
                            onLoginPressed();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonOne(
              text: loginWithTouchId
                  ? S.of(context).loginWithPassword
                  : S.of(context).loginWithTouchId,
              onPressed: () {
                onSwithcLoginMethod();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LoginViewMobileLandscape extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Function onSwithcLoginMethod;
  final bool loginWithTouchId;
  final Function onLoginPressed;
  final isLoggingIn;

  const LoginViewMobileLandscape(
      {Key key,
      this.emailController,
      this.passwordController,
      this.onSwithcLoginMethod,
      this.loginWithTouchId,
      this.onLoginPressed,
      this.isLoggingIn = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      secureScreen: false,
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          loginWithTouchId
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
                        controller: emailController,
                      ),
                    ),
                    vSpace15,
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextFieldOne(
                        hintText: S.of(context).password,
                        controller: passwordController,
                        obscureText: true,
                      ),
                    ),
                    vSpace15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTwo(
                          text: S.of(context).login,
                          showLoader: isLoggingIn,
                          onPressed: () {
                            onSwithcLoginMethod();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ButtonOne(
              text: loginWithTouchId
                  ? S.of(context).loginWithPassword
                  : S.of(context).loginWithTouchId,
              onPressed: () {
                onSwithcLoginMethod();
              },
            ),
          ),
        ],
      ),
    );
  }
}
