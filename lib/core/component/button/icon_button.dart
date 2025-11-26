import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/base_button.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;

  const AppIconButton(this.icon, {super.key});

  @override
  Widget build(BuildContext context) {
    return BaseButton(widget: icon);
  }
}
