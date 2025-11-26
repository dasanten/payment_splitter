import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_splitter/core/extension/context_extension.dart';
import 'package:payment_splitter/feature/calculator/view/calculator_view.dart';

import 'feature/calculator/cubit/payment_splitter/payment_splitter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentSplitterCubit>(
      create: (context) => PaymentSplitterCubit(),
      child: MaterialApp(
        title: 'Payment Splitter',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.indigo)).copyWith(
        canvasColor: Colors.blueGrey,
        scaffoldBackgroundColor: Colors.blue.shade200,
        appBarTheme: context.theme.appBarTheme.copyWith(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
        home: const CalculatorView(),
      ),
    );
  }
}
