import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'payment_splitter_state.dart';

class PaymentSplitterCubit extends Cubit<PaymentSplitterState> {
  PaymentSplitterCubit() : super(PaymentSplitterInitial());
}
