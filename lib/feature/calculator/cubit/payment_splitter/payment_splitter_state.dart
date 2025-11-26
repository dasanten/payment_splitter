part of 'payment_splitter_cubit.dart';

sealed class PaymentSplitterState extends Equatable {
  const PaymentSplitterState();
}

final class PaymentSplitterInitial extends PaymentSplitterState {
  @override
  List<Object> get props => [];
}
