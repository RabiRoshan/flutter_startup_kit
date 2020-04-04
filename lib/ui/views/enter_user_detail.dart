import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../../generated/l10n.dart';
import '../../utils/styles.dart';
import '../view_models/enter_user_details_view_model.dart';
import '../widgets/Buttons.dart';
import '../widgets/TextFields.dart';
import 'base_screen.dart';

class EnterUserDetail extends StatelessWidget {
  EnterUserDetail({Key key}) : super(key: key);

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EnterUserDetailsViewModel>.withConsumer(
      viewModel: EnterUserDetailsViewModel(),
      builder: (context, model, child) => BaseScreen(
        padding: const EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              S.of(context).updateDetails,
              style: largeTextTwoTextPrimaryColorReg,
              textAlign: TextAlign.center,
            ),
            vSpace20,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFieldOne(
                hintText: model.currentUser != null
                    ? model.currentUser.firstName
                    : S.of(context).firstName,
                controller: _firstNameController,
              ),
            ),
            vSpace15,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFieldOne(
                hintText: model.currentUser != null
                    ? model.currentUser.lastName
                    : S.of(context).lastName,
                controller: _lastNameController,
              ),
            ),
            vSpace15,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ButtonTwo(
                  text: S.of(context).update,
                  showLoader: model.isLoading,
                  onPressed: () {
                    model.onSubmitDetails(
                      context,
                      _firstNameController.text,
                      _lastNameController.text,
                    );
                  },
                ),
                hSpace15,
                ButtonTwo(
                  text: S.of(context).back,
                  showLoader: model.isLoading,
                  onPressed: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
