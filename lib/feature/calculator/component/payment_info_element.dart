import 'package:flutter/material.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';

class PaymentInfoElement extends StatelessWidget {
  const PaymentInfoElement({
    required this.icon,
    required this.label,
    this.onInfoPressed,
    super.key,
  });

  final VoidCallback? onInfoPressed;
  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onInfoPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        height: 88,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: context.theme.textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            icon,
          ],
        ),
      ),
    );
  }
}
