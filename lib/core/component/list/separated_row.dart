import 'package:flutter/material.dart';

class SeparatedRow extends StatelessWidget {
  final List<Widget> children;
  final Widget separator;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;

  const SeparatedRow({
    super.key,
    required this.children,
    required this.separator,
    this.mainAxisSize = MainAxisSize.max,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: children
          .expand(
            (element) => [element, if (children.last != element) separator],
          )
          .toList(),
    );
  }
}
