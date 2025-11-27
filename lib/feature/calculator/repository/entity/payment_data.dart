import 'dart:math';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user_identification_mixin.dart';

class PaymentData extends Equatable with UserIdentificationMixin {
  PaymentData() : users = [];

  PaymentData._(this.users);

  PaymentData copy() {
    return PaymentData._(List.of(users));
  }

  final List<User> users;

  void addUser(User user) {
    final color = colorList[users.length % colorList.length];
    final emoji = emojiList[users.length % emojiList.length];
    users.add(user.copyWith(color: color, emoji: emoji));
  }

  int get random => Random().nextInt(100000);

  void removeUser(User user) {
    users.removeWhere((u) => u.id == user.id);
  }

  Color getUserColor(String userId) {
    return getUserById(userId).color ?? Color(0xFFFF0000);
  }

  String getUserEmoji(String userId) {
    return getUserById(userId).emoji ?? 'ERROR';
  }

  User getUserById(String userId) {
    return users.firstWhere((element) => element.id == userId);
  }

  double get highestPayment =>
      users.map((user) => user.originalPayment).fold(0, max);

  double get totalPayment => users.fold(
    0,
    (previousValue, element) => previousValue + element.originalPayment,
  );

  double get averagePayment => users.isEmpty ? 0 : totalPayment / users.length;

  @override
  List<Object> get props => [users];

  void resetTransactions() {
    for (final user in users) {
      user.sendMoneyTo.clear();
      user.getMoneyFrom.clear();
    }
  }
}
