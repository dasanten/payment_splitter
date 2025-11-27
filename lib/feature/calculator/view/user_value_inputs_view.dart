import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_splitter/core/component/button/buttons.dart';
import 'package:payment_splitter/core/component/list/separated_column.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/component/payment_value_input.dart';
import 'package:payment_splitter/feature/calculator/cubit/payment_splitter/payment_splitter_cubit.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';

class UserValueInputsView extends StatelessWidget {
  const UserValueInputsView({super.key, required this.paymentData});

  final PaymentData paymentData;

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      separator: 8.verticalSpace,
      children: [
        ...List.generate(paymentData.users.length, (index) {
          final user = paymentData.users[index];
          return PaymentValueInput(user: user);
        }),
        Center(
          child: SizedBox(
            width: 200,
            child: PrimaryButton(
              label: "Add User",
              prefixIcon: Icon(
                Icons.add,
                fontWeight: FontWeight.bold,
                color: context.colorScheme.onPrimary,
              ),
              onPressed: () {
                context.read<PaymentSplitterCubit>().addUser();
              },
            ),
          ),
        ),
      ],
    );
  }
}
