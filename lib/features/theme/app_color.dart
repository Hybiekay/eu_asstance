import 'package:flutter/material.dart';

class AppColor {
  static primary(BuildContext context) {
    Color primary = Theme.of(context).colorScheme.primary;
    return primary;
  }

  static onPrimary(BuildContext context) {
    Color onPrimary = Theme.of(context).colorScheme.onPrimary;
    return onPrimary;
  }

  static backGround(BuildContext context) {
    Color onPrimary = Theme.of(context).colorScheme.background;
    return onPrimary;
  }

  static secondry(BuildContext context) {
    Color secondary = Theme.of(context).colorScheme.secondary;
    return secondary;
  }

  static onSecondry(BuildContext context) {
    Color osecondary = Theme.of(context).colorScheme.onSecondary;
    return osecondary;
  }
}
