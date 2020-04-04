import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../generated/l10n.dart';
import '../../locator.dart';
import '../../models/error_response.dart';
import '../../models/user.dart';
import '../../utils/shared_preferences_helper.dart';
import '../../utils/styles.dart';
import 'base_view_model.dart';

class EnterUserDetailsViewModel extends BaseViewModel {
  User currentUser;

  EnterUserDetailsViewModel() {
    _init();
  }

  _init() async {
    setLoading(true);

    currentUser = await getIt<SharedPreferencesHelper>().getLocalUserData();

    setLoading(false);
  }

  onSubmitDetails(
      BuildContext context, String firstName, String lastName) async {
    setLoading(true);

    try {
      await getIt<SharedPreferencesHelper>()
          .setLocalUserData(User(firstName: firstName, lastName: lastName));
    } catch (e) {
      var error = ErrorResponse(error: e.message);
      Get.snackbar(
        S.of(context).updateDataError,
        e.error,
        titleText: Text(
          S.of(context).updateDataError,
          style: smallTextOneAppPrimaryColorBold,
        ),
        messageText: Text(
          error.error,
          style: tinyTextOneAppPrimaryColorBold,
        ),
        backgroundColor: Colors.transparent,
        colorText: Colors.red,
      );
    } finally {
      setLoading(false);
    }
  }
}
