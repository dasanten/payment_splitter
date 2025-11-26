import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/buttons.dart';
import 'package:payment_splitter/core/component/button/icon_button.dart';
import 'package:payment_splitter/core/component/list/separated_column.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Example View')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SeparatedColumn(
          separator: 12.verticalSpace,
          children: [
            PrimaryButton(
              label: "Primary Button",
              onPressed: () => context.navigator.pop(),
            ),
            AppIconButton(
              Icon(
                Icons.add,
                fontWeight: FontWeight.bold,
                size: 30,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
