import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../locator.dart';
import '../../router.dart';
import '../../services/auth_service.dart';
import '../../services/shared_preferences_helper.dart';
import 'base_view_model.dart';

class LoginViewModel extends BaseViewModel {
  onLoginPressed(BuildContext context, String email, String password) {
    setLoading(true);

    getIt<AuthService>()
        .login(email: email, password: password)
        .then((response) async {
          final hasCommited =
              await getIt<SharedPreferencesHelper>().hasUserDataCommited();
          if (hasCommited) Get.offAllNamed(HomeRoute);
          // else
          // Get.offAllNamed(LoginUserDetailRoute);
        })
        .catchError(
          (error) => Get.snackbar(
            S.of(context).snackbarErrorHeader,
            error.message,
            backgroundColor: Colors.white,
          ),
        )
        .whenComplete(() => setLoading(false));
  }
}
