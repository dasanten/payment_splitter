import 'package:flutter/material.dart';

extension IntX on int {
  SizedBox get verticalSpace => SizedBox(height: toDouble());

  SizedBox get horizontalSpace => SizedBox(width: toDouble());
}

extension DoubleX on double {
  double toFixedAndCeil([int decimalPoints = 2]) {
    final factor = 10 ^ decimalPoints + 1;
    final ceilValue = (this * factor).ceil() / factor;
    final fixed = double.parse(ceilValue.toStringAsFixed(2));
    return fixed;
  }
}
