import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class ButtonOne extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onPressed;
  final bool showLoader;

  const ButtonOne({
    Key key,
    this.text = "Button Text",
    this.child,
    this.onPressed,
    this.showLoader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS)
      return CupertinoButton(
        onPressed: !showLoader ? onPressed : null,
        disabledColor: appPrimaryColor,
        color: appAccentColor,
        padding: const EdgeInsets.all(30),
        borderRadius: BorderRadius.all(
          Radius.circular(
            14,
          ),
        ),
        child: generateButtonChild(showLoader, child, text),
      );
    else
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            14,
          ),
        ),
        child: FlatButton(
          onPressed: !showLoader ? onPressed : null,
          disabledColor: appPrimaryColor,
          color: appAccentColor,
          padding: const EdgeInsets.all(30),
          child: generateButtonChild(showLoader, child, text),
        ),
      );
  }
}

class ButtonTwo extends StatelessWidget {
  final Widget child;
  final String text;
  final Function onPressed;
  final bool showLoader;

  const ButtonTwo({
    Key key,
    this.text = "Button Text",
    this.child,
    this.onPressed,
    this.showLoader = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Theme.of(context).platform == TargetPlatform.iOS)
      return CupertinoButton(
        onPressed: !showLoader ? onPressed : null,
        disabledColor: appPrimaryColor,
        color: appPrimaryColor,
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        child: generateButtonChild(showLoader, child, text),
      );
    else
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        child: FlatButton(
          onPressed: !showLoader ? onPressed : null,
          disabledColor: appPrimaryColor,
          color: appPrimaryColor,
          padding: const EdgeInsets.all(15),
          child: generateButtonChild(showLoader, child, text),
        ),
      );
  }
}

Widget generateButtonChild(bool showLoader, child, text) => showLoader
    ? (CircularProgressIndicator(
        backgroundColor: textPrimaryColor,
      ))
    : (child ??
        Center(
          child: Text(
            text,
            style: smallTextOneTextPrimaryColorBold,
          ),
        ));
