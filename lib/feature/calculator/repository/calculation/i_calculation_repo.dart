import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';

abstract class ICalculationRepo {
  PaymentData calculatePayments(PaymentData payments);
}
