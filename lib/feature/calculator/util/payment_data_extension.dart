import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';

import '../repository/entity/payment_data.dart';

extension PaymentDataExtension on PaymentData {
  BarChartRodData _originalPaymentRod(User user) => BarChartRodData(
    toY: user.originalPayment,
    borderRadius: BorderRadius.circular(4),
    width: 22,
    color: getUserColor(user.id),
  );

  BarChartRodData _adjustedPaymentRod(User user) {
    var currentAmount = user.originalPayment;
    return BarChartRodData(
      toY: user.currentPayment,
      borderRadius: BorderRadius.circular(4),
      width: 22,
      rodStackItems: [
        if (user.currentPayment != 0)
          BarChartRodStackItem(0, user.originalPayment, getUserColor(user.id)),
        ...List.generate((user.sendMoneyTo).length, (index) {
          final currentUser = user.sendMoneyTo[index];
          final startValue = currentAmount;
          currentAmount += currentUser.amount;
          return BarChartRodStackItem(
            startValue,
            currentAmount,
            getUserColor(currentUser.userId),
          );
        }),
      ],
    );
  }

  List<BarChartGroupData> toBarData() {
    return List.generate(users.length, (index) {
      final user = users[index];
      return BarChartGroupData(
        x: index,
        barRods: [
          _originalPaymentRod(user),
          if (user.currentPayment != user.originalPayment)
            _adjustedPaymentRod(users[index]),
        ],
      );
    });
  }
}
