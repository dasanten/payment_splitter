import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:payment_splitter/feature/calculator/repository/calculation/calculation_repo_impl.dart';
import 'package:payment_splitter/feature/calculator/repository/calculation/i_calculation_repo.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/payment_data.dart';
import 'package:payment_splitter/feature/calculator/repository/entity/user.dart';

part 'payment_splitter_state.dart';

class PaymentSplitterCubit extends Cubit<PaymentSplitterState> {
  PaymentSplitterCubit() : super(PaymentSplitterInitial(PaymentData()));

  final ICalculationRepo calculationRepo = CalculationRepoImpl();

  void addUser() {
    final data = state.paymentData.copy();
    data.addUser(User(originalPayment: 0.0));
    recalculatePayments(data);
  }

  void recalculatePayments(PaymentData paymentData) {
    final data = calculationRepo.calculatePayments(paymentData);
    emit(PaymentSplitterInitial(data));
  }

  void removeUser(User user) {
    final data = state.paymentData.copy();
    data.removeUser(user);
    recalculatePayments(data);
  }

  void userValueChanged(User user, double newValue) {
    final data = state.paymentData.copy();
    final userIndex = data.users.indexWhere((u) => u.id == user.id);
    if (userIndex != -1) {
      data.users[userIndex] = data.users[userIndex].copyWith(
        originalPayment: newValue,
      );
      recalculatePayments(data);
    }
  }

  void reset() {
    emit(PaymentSplitterInitial(PaymentData()));
  }
}

PaymentData buildMockData() {
  final data = PaymentData();

  final users = randomUsers(15);
  for (final user in users) {
    data.addUser(user);
  }

  final calcRepo = CalculationRepoImpl();
  return calcRepo.calculatePayments(data);
}

List<User> fixedUsers() {
  return [
    User(originalPayment: 0.0),
    User(originalPayment: 1.0),
    User(originalPayment: 1.0),
    User(originalPayment: 6.0),
    User(originalPayment: 7.0),
  ];
}

List<User> randomUsers(int count) {
  return List.generate(
    count,
    (_) => User(originalPayment: Random().nextInt(20).toDouble()),
  );
}
