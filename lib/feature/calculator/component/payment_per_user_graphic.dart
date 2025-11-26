import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/util/payment_data_extension.dart';

class PaymentPerUserGraphic extends StatelessWidget {
  const PaymentPerUserGraphic({required this.paymentData, super.key});

  final PaymentData paymentData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const SizedBox(height: 32),
        Expanded(child: BarChart(chartData())),
      ],
    );
  }

  Widget getTitles(double index, TitleMeta meta) {
    final user = paymentData.users[index.toInt()];

    final text = Text(user.emoji ?? 'MISSING');
    return SideTitleWidget(meta: meta, child: text);
  }

  BarChartData chartData() {
    return BarChartData(
      maxY: paymentData.highestPayment.ceilToDouble(),
      barTouchData: const BarTouchData(enabled: false),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 32,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(reservedSize: 50, showTitles: true),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles()),
        rightTitles: const AxisTitles(sideTitles: SideTitles()),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: false),
      barGroups: paymentData.toBarData(),
    );
  }
}
