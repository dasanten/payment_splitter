import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/base_button.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;

  const AppIconButton(this.icon, {super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BaseButton(widget: icon, onPressed: onPressed);
  }
}
