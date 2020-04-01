import 'package:flutter/material.dart';
import 'package:provider_architecture/provider_architecture.dart';

import '../view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<LoginViewModel>.withConsumer(
      viewModel: LoginViewModel(),
      builder: (context, model, child) => Scaffold(
          body: Container(
        child: Center(
          child: Text("Login Screen"),
        ),
      )),
    );
  }
}
