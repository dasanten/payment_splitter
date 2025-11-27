import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/cubit/payment_splitter/payment_splitter_cubit.dart';
import 'package:payment_splitter/feature/calculator/view/payment_info_view.dart';
import 'package:payment_splitter/feature/calculator/view/user_value_inputs_view.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentSplitterCubit, PaymentSplitterState>(
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView(
              children: [
                16.verticalSpace,
                PaymentInfoView(paymentData: state.paymentData),
                16.verticalSpace,
                UserValueInputsView(paymentData: state.paymentData),
                16.verticalSpace,
              ],
            ),
          ),
        );
      },
    );
  }
}
