import 'package:flutter/material.dart';
import 'package:opay_flutter/widget/saving_content.dart';

const containerStyle = BoxDecoration(
  color: Color.fromARGB(255, 218, 212, 208),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

class FinanceWidget extends StatefulWidget {
  const FinanceWidget({super.key});

  @override
  State<FinanceWidget> createState() => _FinanceWidgetState();
}

class _FinanceWidgetState extends State<FinanceWidget> {
  Widget content = const SavingDetails();

  void onGetLoanScreenFn(BuildContext context) {
    setState(() {
      content = const Center(
        child:  Text(
          "Download O cash to get loan",
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      );
    });
  }

  void onShowSavingScreenFn() {
    // on show saving context
    setState(() {
      content = const SavingDetails();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100.5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  onTap: onShowSavingScreenFn,
                  child: const Text(
                    "Saving",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    onGetLoanScreenFn(context);
                  },
                  child: const Text(
                    "Loan",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          content
        ],
      ),
    );
  }
}
