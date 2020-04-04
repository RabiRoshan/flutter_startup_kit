import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../locator.dart';
import '../../services/auth_service.dart';
import '../../utils/styles.dart';

class BaseScreen extends StatefulWidget {
  final Widget child;
  final EdgeInsets padding;
  final bool secureScreen;

  const BaseScreen(
      {Key key, this.child, this.padding, this.secureScreen = true})
      : super(key: key);

  @override
  _BaseScreenState createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.secureScreen)
      WidgetsBinding.instance.addPostFrameCallback((_) {
        getIt<AuthService>().isLoggedIn.listen((onData) {
          redirectToLogin(onData);
        });
      });
  }

  redirectToLogin(bool isLoggedIn) {
    if (!isLoggedIn) Get.until('/', (_) => true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: widget.padding,
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          width: double.infinity,
          decoration: BoxDecoration(gradient: backgroundGradient),
          child: widget.child,
        ),
      ),
    );
  }
}
