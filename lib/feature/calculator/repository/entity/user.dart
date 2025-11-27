import 'dart:ui';

import 'package:equatable/equatable.dart';
import 'package:payment_splitter/core/extension/int_extension.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user_send_money.dart';
import 'package:uuid/uuid.dart';

class User extends Equatable {
  User._({
    required this.id,
    required this.originalPayment,
    this.color,
    this.emoji,
  });

  final String id;
  final double originalPayment;
  final Color? color;
  final String? emoji;
  final List<UserSendMoney> sendMoneyTo = [];
  final List<UserSendMoney> getMoneyFrom = [];

  User({required this.originalPayment, this.color, this.emoji})
    : id = Uuid().v6();

  User copyWith({
    double? originalPayment,
    List<UserSendMoney>? sendMoneyTo,
    List<UserSendMoney>? getMoneyFrom,
    Color? color,
    String? emoji,
  }) {
    return User._(
      id: id,
      originalPayment: originalPayment ?? this.originalPayment,
      color: color ?? this.color,
      emoji: emoji ?? this.emoji,
    );
  }

  double get currentPayment =>
      originalPayment - totalReceivedPayment + totalSentPayment;

  double get totalReceivedPayment => getMoneyFrom.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );

  double get totalSentPayment => sendMoneyTo.fold(
    0,
    (previousValue, element) => previousValue + element.amount,
  );

  double paymentDifference(double averagePayment) {
    return currentPayment - averagePayment;
  }

  bool isInDebt(double averagePayment) {
    return paymentDifference(averagePayment) < 0;
  }

  bool isDeptReceiver(double averagePayment) {
    return paymentDifference(averagePayment) > 0;
  }

  String get originalPaymentString =>
      originalPayment.toFixedAndCeil().toString();

  @override
  List<Object?> get props => [
    id,
    originalPayment,
    color,
    emoji,
    sendMoneyTo,
    getMoneyFrom,
  ];
}
