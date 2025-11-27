part of 'payment_splitter_cubit.dart';

sealed class PaymentSplitterState extends Equatable {
  final PaymentData paymentData;

  const PaymentSplitterState(this.paymentData);

  @override
  List<Object> get props => [paymentData];
}

final class PaymentSplitterInitial extends PaymentSplitterState {
  const PaymentSplitterInitial(super.paymentData);

  @override
  List<Object> get props => [paymentData];
}
