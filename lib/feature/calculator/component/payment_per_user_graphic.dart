import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/util/payment_data_extension.dart';

class PaymentPerUserGraphic extends StatelessWidget {
  const PaymentPerUserGraphic({required this.paymentData, super.key});

  final PaymentData paymentData;

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    final screenWidth = size.width;
    final maxElementHeight = 300;
    final screenHeight = size.height;
    final elementHeight = maxElementHeight < screenHeight
        ? maxElementHeight
        : screenHeight;
    final double calculatedWidth = paymentData.users.length * 60 + 40;
    final minWidth = screenWidth - 32;
    final width = calculatedWidth < minWidth ? minWidth : calculatedWidth;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      width: width,
      height: elementHeight.toDouble(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          width: calculatedWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              32.verticalSpace,
              Expanded(child: BarChart(chartData())),
            ],
          ),
        ),
      ),
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
      barTouchData: BarTouchData(
        enabled: true,
        touchTooltipData: BarTouchTooltipData(
          getTooltipItem: (group, groupIndex, rod, rodIndex) => BarTooltipItem(
            '${rod.toY.toFixedAndCeil()}€',
            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
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
          sideTitles: SideTitles(reservedSize: 32, showTitles: true),
        ),
        topTitles: const AxisTitles(sideTitles: SideTitles()),
        rightTitles: const AxisTitles(sideTitles: SideTitles()),
      ),
      borderData: FlBorderData(show: false),
      gridData: const FlGridData(show: true),
      barGroups: paymentData.toBarData(),
    );
  }
}
