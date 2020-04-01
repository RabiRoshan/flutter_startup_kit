import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String currentUser;

  const HomeScreen({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Home Screen"),
      ),
    );
  }
}
