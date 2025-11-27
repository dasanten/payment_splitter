import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/list/separated_column.dart';
import 'package:payment_splitter/core/component/list/separated_row.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/component/payment_info_element.dart';
import 'package:payment_splitter/feature/calculator/component/payment_per_user_graphic.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/view/transactions_view.dart';

class PaymentInfoView extends StatelessWidget {
  const PaymentInfoView({required this.paymentData, super.key});

  final PaymentData paymentData;

  @override
  Widget build(BuildContext context) {
    return SeparatedColumn(
      mainAxisAlignment: MainAxisAlignment.start,
      separator: 16.verticalSpace,
      children: [
        PaymentPerUserGraphic(paymentData: paymentData),
        SeparatedRow(
          separator: 16.horizontalSpace,
          children: [
            Expanded(
              child: PaymentInfoElement(
                icon: Icon(
                  Icons.info_outline,
                  size: 32,
                  fontWeight: FontWeight.bold,
                ),
                label: 'Info',
                onInfoPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) =>
                        TransactionsView(paymentData: paymentData),
                  );
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) => ExampleView()),
                  // );
                },
              ),
            ),
            Expanded(
              child: PaymentInfoElement(
                icon: Text(
                  '${paymentData.averagePayment.toFixedAndCeil()}€',
                  style: context.theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                label: 'Average Payment',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
