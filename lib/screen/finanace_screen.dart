import 'package:flutter/material.dart';
import 'package:opay_flutter/widget/finance_widget/finance_widget.dart';

class FinanceScreen extends StatelessWidget {
  const FinanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Finance from our partners",
          style: TextStyle(
            color: Colors.black,
            fontSize: 19,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        backgroundColor: Colors.white,
      ),
      body: const SafeArea(
        child: FinanceWidget(),
      ),
    );
  }
}
