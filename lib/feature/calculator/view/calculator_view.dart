import 'dart:math';

import 'package:flutter/material.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/repository/calculation/calculation_repo_impl.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';
import 'package:payment_splitter/feature/calculator/view/payment_info_view.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            16.verticalSpace,
            PaymentInfoView(paymentData: buildMockData()),
          ],
        ),
      ),
    );
  }
}

PaymentData buildMockData() {
  final data = PaymentData();

  final users = randomUsers(15);
  for (final user in users) {
    data.addUser(user);
  }

  final calcRepo = CalculationRepoImpl();
  return calcRepo.calculatePayments(data);
}

List<User> fixedUsers() {
  return [
    User(originalPayment: 0.0),
    User(originalPayment: 1.0),
    User(originalPayment: 1.0),
    User(originalPayment: 6.0),
    User(originalPayment: 7.0),
  ];
}

List<User> randomUsers(int count) {
  return List.generate(
    count,
    (_) => User(originalPayment: Random().nextInt(20).toDouble()),
  );
}
