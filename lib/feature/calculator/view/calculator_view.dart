import 'dart:math';

import 'package:flutter/material.dart';
import 'package:payment_splitter/core/view/example_view.dart';
import 'package:payment_splitter/feature/calculator/component/payment_per_user_graphic.dart';
import 'package:payment_splitter/feature/calculator/repository/calculation/calculation_repo_impl.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_input_component),
            onPressed: () {
              Navigator.of(
                context,
              ).push(MaterialPageRoute(builder: (context) => ExampleView()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: PaymentPerUserGraphic(paymentData: buildMockData())),
        ],
      ),
    );
  }
}

PaymentData buildMockData() {
  final data = PaymentData();

  final users = randomUsers(5);
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
