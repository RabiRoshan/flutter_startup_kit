import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../locator.dart';
import '../../services/auth_service.dart';
import '../../utils/styles.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool loginWithTouchId = true;

  changeLoginMode() async {
    loginWithTouchId = !loginWithTouchId;
    notifyListeners();
  }

  onLoginPressed(BuildContext context) async {
    setLoading(true);

    try {
      await getIt<AuthService>()
          .login(email: emailController.text, password: emailController.text);
    } catch (e) {
      setLoading(false);

      Get.snackbar(
        S.of(context).loginError,
        e.error,
        titleText: Text(
          S.of(context).loginError,
          style: smallTextOneAppPrimaryColorBold,
        ),
        messageText: Text(
          e.error,
          style: tinyTextOneAppPrimaryColorBold,
        ),
        backgroundColor: Colors.transparent,
        colorText: Colors.red,
      );
    }
  }
}
