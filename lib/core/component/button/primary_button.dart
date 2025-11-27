import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/base_button.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.label,
    this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
  });

  final VoidCallback? onPressed;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPressed: onPressed,
      widget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[prefixIcon!, 8.horizontalSpace],
          Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (suffixIcon != null) suffixIcon!,
        ],
      ),
    );
  }
}
