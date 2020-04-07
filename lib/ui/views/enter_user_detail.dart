import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../bloc/enter_user_detail_screen_bloc/enter_user_detail_screen_bloc.dart';
import '../../generated/l10n.dart';
import '../../models/user.dart';
import '../../utils/styles.dart';
import '../widgets/Buttons.dart';
import '../widgets/TextFields.dart';
import 'base_screen.dart';

class EnterUserDetail extends StatefulWidget {
  EnterUserDetail({Key key}) : super(key: key);

  @override
  _EnterUserDetailState createState() => _EnterUserDetailState();
}

class _EnterUserDetailState extends State<EnterUserDetail> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  // Bloc created manually
  final _enterUserDetailScreenBloc = EnterUserDetailScreenBloc();

  @override
  void didChangeDependencies() {
    _enterUserDetailScreenBloc.add(
      LoadUserDetails(),
    );
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // Manually created blocs must be closed
    _enterUserDetailScreenBloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
      ),
      child: BlocProvider.value(
        value: _enterUserDetailScreenBloc,
        child:
            BlocBuilder<EnterUserDetailScreenBloc, EnterUserDetailScreenState>(
          builder: (BuildContext context, state) => Column(
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
                  hintText: (state is UserDetailsLoaded && state.user != null)
                      ? state.user.firstName
                      : S.of(context).firstName,
                  controller: _firstNameController,
                ),
              ),
              vSpace15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: TextFieldOne(
                  hintText: (state is UserDetailsLoaded && state.user != null)
                      ? state.user.lastName
                      : S.of(context).lastName,
                  controller: _lastNameController,
                ),
              ),
              vSpace15,
              state is UserDetailsLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ButtonTwo(
                          text: S.of(context).update,
                          onPressed: () {
                            BlocProvider.of<EnterUserDetailScreenBloc>(context)
                                .add(
                              UpdateUserDetails(
                                User(
                                  firstName: _firstNameController.text,
                                  lastName: _lastNameController.text,
                                ),
                              ),
                            );
                          },
                        ),
                        hSpace15,
                        ButtonTwo(
                          text: S.of(context).back,
                          onPressed: () {
                            Get.back();
                          },
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
