import 'package:flutter/material.dart';
import 'package:payment_splitter/core/component/button/icon_button.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';

class TransactionsView extends StatelessWidget {
  final PaymentData paymentData;

  const TransactionsView({super.key, required this.paymentData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              'Transaktionen',
              style: context.theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              AppIconButton(
                Icon(Icons.close),
                removePadding: true,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              8.horizontalSpace,
            ],
          ),
          backgroundColor: Colors.transparent,
          body: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            shrinkWrap: true,
            itemCount: paymentData.users.length,
            separatorBuilder: (_, _) => Divider(),
            itemBuilder: (context, index) {
              final user = paymentData.users[index];
              return _TransactionsViewWrapper(
                user: user,
                paymentData: paymentData,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TransactionsViewWrapper extends StatelessWidget {
  final User user;
  final PaymentData paymentData;

  const _TransactionsViewWrapper({
    required this.user,
    required this.paymentData,
  });

  @override
  Widget build(BuildContext context) {
    final paymentsRequired = user.sendMoneyTo.isNotEmpty;
    return Column(
      children: [
        Text(
          'Transactions for ${user.emoji}',
          style: context.theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          'Original Payment: ${user.originalPayment}€',
          style: context.theme.textTheme.bodySmall,
        ),
        8.verticalSpace,
        paymentsRequired
            ? _UserTransactionsView(user: user, paymentData: paymentData)
            : const _NoPaymentsRequiredWidget(),
      ],
    );
  }
}

class _UserTransactionsView extends StatelessWidget {
  final User user;
  final PaymentData paymentData;

  const _UserTransactionsView({required this.user, required this.paymentData});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: user.sendMoneyTo.length,
      separatorBuilder: (_, _) => 6.verticalSpace,
      itemBuilder: (context, index) {
        final transaction = user.sendMoneyTo[index];
        return Text(
          'Pay ${transaction.displayAmount}€ to ${paymentData.getUserEmoji(transaction.userId)}',
        );
      },
    );
  }
}

class _NoPaymentsRequiredWidget extends StatelessWidget {
  const _NoPaymentsRequiredWidget();

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('No payments required'));
  }
}
