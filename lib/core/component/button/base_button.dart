import 'dart:async';

import 'package:flutter/material.dart';

class BaseButton extends StatefulWidget {
  const BaseButton({
    required this.widget,
    this.onPressed,
    this.customPadding,
    this.buttonColor = Colors.blue,
    this.shadowColor = Colors.black,
    super.key,
  });

  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? customPadding;
  final Widget widget;
  final Color buttonColor;
  final Color shadowColor;

  @override
  State<StatefulWidget> createState() => _BaseButtonState();
}

class _BaseButtonState extends State<BaseButton> {
  bool isPressed = false;

  Timer? timer;

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onPressed?.call();
        if (widget.onPressed != null) {
          setState(() {
            isPressed = true;
          });
          timer = Timer(const Duration(milliseconds: 350), () {
            setState(() {
              isPressed = false;
            });
          });
        }
      },
      child: Padding(
        padding: isPressed
            ? EdgeInsets.only(right: 7, bottom: 6)
            : const EdgeInsets.only(left: 7, top: 6),
        child: Container(
          padding:
              widget.customPadding ??
              const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
          decoration: BoxDecoration(
            color: widget.buttonColor,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: isPressed
                ? []
                : [
                    BoxShadow(
                      color: widget.shadowColor,
                      offset: const Offset(-2, -6),
                    ),
                    BoxShadow(
                      color: widget.shadowColor,
                      offset: const Offset(-7, -2),
                    ),
                    BoxShadow(
                      color: widget.shadowColor,
                      offset: const Offset(-7, -6),
                    ),
                  ],
          ),
          child: widget.widget,
        ),
      ),
    );
  }
}
