import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/auth_bloc/auth_bloc.dart';
import '../../router.dart';
import '../../utils/styles.dart';

// This is customized according to your app.
// Here this screen serves to provide a common scaffold background and
// to redirect to login screen if unauthenticated (if secureScreen is true).

class BaseScreen extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool secureScreen;

  const BaseScreen(
      {Key key, this.child, this.padding, this.secureScreen = true})
      : super(key: key);

  redirectToLogin() {
    Get.offAllNamed(LoginRoute);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (secureScreen && state is UnauthenticatedState) redirectToLogin();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: padding,
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            width: double.infinity,
            decoration: BoxDecoration(gradient: backgroundGradient),
            child: child,
          ),
        ),
      ),
    );
  }
}
