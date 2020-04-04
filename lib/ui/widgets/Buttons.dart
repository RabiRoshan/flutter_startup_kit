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
        onPressed: onPressed,
        color: appAccentColor,
        padding: const EdgeInsets.all(30),
        borderRadius: BorderRadius.all(
          Radius.circular(
            14,
          ),
        ),
        child: showLoader
            ? (CircularProgressIndicator(
                backgroundColor: textPrimaryColor,
              ))
            : (child ??
                Center(
                  child: Text(
                    text,
                    style: smallTextOneTextPrimaryColorReg,
                  ),
                )),
      );
    else
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            14,
          ),
        ),
        child: FlatButton(
          onPressed: onPressed,
          color: appAccentColor,
          padding: const EdgeInsets.all(30),
          child: showLoader
              ? (CircularProgressIndicator(
                  backgroundColor: textPrimaryColor,
                ))
              : (child ??
                  Center(
                    child: Text(
                      text,
                      style: smallTextOneTextPrimaryColorReg,
                    ),
                  )),
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
        onPressed: onPressed,
        color: appPrimaryColor,
        padding: const EdgeInsets.all(15),
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        child: showLoader
            ? (CircularProgressIndicator(
                backgroundColor: textPrimaryColor,
              ))
            : (child ??
                Center(
                  child: Text(
                    text,
                    style: smallTextOneTextPrimaryColorBold,
                  ),
                )),
      );
    else
      return ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        child: FlatButton(
          onPressed: onPressed,
          color: appPrimaryColor,
          padding: const EdgeInsets.all(15),
          child: showLoader
              ? (CircularProgressIndicator(
                  backgroundColor: textPrimaryColor,
                ))
              : (child ??
                  Center(
                    child: Text(
                      text,
                      style: smallTextOneTextPrimaryColorBold,
                    ),
                  )),
        ),
      );
  }
}
