import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/base_button.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final bool removePadding;

  const AppIconButton(
    this.icon, {
    super.key,
    this.onPressed,
    this.removePadding = false,
  });

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      widget: icon,
      onPressed: onPressed,
      customPadding: removePadding ? EdgeInsets.zero : null,
    );
  }
}
