import 'package:payment_splitter/core/extension/int_extension.dart';

class UserSendMoney {
  final String userId;
  final double amount;

  String get displayAmount => amount.toFixedAndCeil().toString();

  UserSendMoney({required this.userId, required this.amount});
}
