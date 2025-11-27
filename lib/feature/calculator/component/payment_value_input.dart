import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_splitter/core/component/input/default_input.dart';
import 'package:payment_splitter/feature/calculator/cubit/payment_splitter/payment_splitter_cubit.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';

class PaymentValueInput extends StatelessWidget {
  const PaymentValueInput({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return DefaultInput(
      label: "${user.emoji} Summe:",
      keyboardType: TextInputType.numberWithOptions(),
      onSuffixIconPressed: () {
        context.read<PaymentSplitterCubit>().removeUser(user);
      },
      // initialValue: user.originalPayment.toString(),
      suffixIcon: Icons.delete_forever,
      onChanged: (value) {
        final parsedValue = double.tryParse(value) ?? 0.0;
        context.read<PaymentSplitterCubit>().userValueChanged(
          user,
          parsedValue,
        );
      },
    );
  }
}
