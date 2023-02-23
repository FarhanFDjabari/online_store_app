import 'package:flutter/material.dart';

class TransactionResultScreen extends StatelessWidget {
  final String orderId;

  const TransactionResultScreen({required this.orderId, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
