import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    super.key,
    required this.widget,
    this.onPressed,
    this.buttonColor = Colors.blue,
    this.shadowColor = Colors.black,
  });

  final VoidCallback? onPressed;
  final Widget widget;
  final Color buttonColor;
  final Color shadowColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(color: shadowColor, offset: const Offset(2, 6)),
            BoxShadow(color: shadowColor, offset: const Offset(7, 2)),
            BoxShadow(color: shadowColor, offset: const Offset(7, 6)),
          ],
        ),
        child: widget,
      ),
    );
  }
}
