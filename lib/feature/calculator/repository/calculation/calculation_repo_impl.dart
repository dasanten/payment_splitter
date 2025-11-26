import 'package:payment_splitter/feature/calculator/repository/calculation/i_calculation_repo.dart';
import 'package:payment_splitter/feature/calculator/repository/calculation/payment_splitter.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';

class CalculationRepoImpl implements ICalculationRepo {
  @override
  PaymentData calculatePayments(PaymentData payments) {
    final splitter = PaymentSplitter(payments: payments)..calculate();

    return splitter.payments;
  }
}
