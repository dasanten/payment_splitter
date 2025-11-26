import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user_send_money.dart';

class PaymentSplitter {
  PaymentData payments;

  PaymentSplitter({required this.payments});

  void calculate() {
    while (_getHasUnsettledPayments()) {
      _distributePayments();
    }
  }

  void _distributePayments() {
    final avg = payments.averagePayment;
    final highestPayer = _getUserWithHighestDebt();
    final topReceiver = _getUserReceivingMostMoney();

    final deptAmount = highestPayer.paymentDifference(avg).abs();
    final creditAmount = topReceiver.paymentDifference(avg).abs();

    final transferAmount = deptAmount < creditAmount
        ? deptAmount
        : creditAmount;

    paymentTransfer(highestPayer, topReceiver, transferAmount);
  }

  void paymentTransfer(User sender, User receiver, double amount) {
    sender.sendMoneyTo.add(UserSendMoney(userId: receiver.id, amount: amount));
    receiver.getMoneyFrom.add(UserSendMoney(userId: sender.id, amount: amount));
  }

  User _getUserWithHighestDebt() {
    final avg = payments.averagePayment;
    return payments.users.reduce(
      (current, next) =>
          current.paymentDifference(avg) < next.paymentDifference(avg)
          ? current
          : next,
    );
  }

  User _getUserReceivingMostMoney() {
    final avg = payments.averagePayment;
    return payments.users.reduce(
      (current, next) =>
          current.paymentDifference(avg) > next.paymentDifference(avg)
          ? current
          : next,
    );
  }

  bool _getHasUnsettledPayments() {
    final avg = payments.averagePayment;
    for (final user in payments.users) {
      if (user.paymentDifference(avg).abs() > 0.01) {
        return true;
      }
    }
    return false;
  }
}
