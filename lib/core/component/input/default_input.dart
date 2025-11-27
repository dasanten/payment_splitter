import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/icon_button.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';

class DefaultInput extends StatelessWidget {
  const DefaultInput({
    super.key,
    this.suffixIcon,
    this.label,
    this.onSuffixIconPressed,
    this.onChanged,
    this.keyboardType,
    this.initialValue,
  });

  final String? label;
  final String? initialValue;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconPressed;
  final shadowColor = Colors.black;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4.5, bottom: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: Text(
                label!,
                style: context.theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            2.verticalSpace,
          ],
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: shadowColor,
                        offset: const Offset(-1, 4),
                      ),
                      BoxShadow(
                        color: shadowColor,
                        offset: const Offset(-4.5, 1),
                      ),
                      BoxShadow(
                        color: shadowColor,
                        offset: const Offset(-4.5, 4),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                    ),
                    initialValue: initialValue,
                    keyboardType: keyboardType,
                    onFieldSubmitted: onChanged,
                  ),
                ),
              ),
              if (suffixIcon != null) ...[
                8.horizontalSpace,
                _SuffixIcon(
                  iconData: suffixIcon!,
                  onPressed: onSuffixIconPressed,
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _SuffixIcon extends StatelessWidget {
  const _SuffixIcon({required this.iconData, this.onPressed});

  final IconData iconData;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return AppIconButton(
      onPressed: onPressed,
      Icon(
        iconData,
        fontWeight: FontWeight.bold,
        size: 24,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
