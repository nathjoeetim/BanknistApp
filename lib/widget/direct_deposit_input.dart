import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opay_flutter/bottom_navbar.dart';
import 'package:opay_flutter/data/current_user.dart';
import 'package:opay_flutter/data/transfer_model.dart';
import 'package:opay_flutter/provider/tab_controller.dart';

import '../data/all_users_model.dart';

class DepositInput extends StatefulWidget {
  const DepositInput({super.key});

  @override
  State<DepositInput> createState() => _DepositInputState();
}

class _DepositInputState extends State<DepositInput> {
  final AccountController fundAccount = Get.put(AccountController());
  late String amount;
  final fundAccountKey = GlobalKey<FormState>();

  void fundAccountFunction() async {
    if (fundAccountKey.currentState?.validate() ?? false) {
      fundAccountKey.currentState?.save();

      await fundAccount.fundAccount(
        TransferRequest(
          phoneNumber: fundAccount.getCurrentUsers.value.phoneNumber,
          amount: amount,
        ),
      );

      await fundAccount.getAllUsers(
          LoginInputNumber(fundAccount.getCurrentUsers.value.phoneNumber));

      _showBottomSheet(); // Added this line

      fundAccountKey.currentState?.reset();
    }
  }

  // Function to show the bottom sheet
  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BottomNavigation(),
                )),
                title: Center(
                  child: Column(
                    children: [
                      Obx(
                        () => Text(
                          ' ${fundAccount.getMessage}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 59, 181, 108),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primaryContainer,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const Text(
                          'Proceed to dashBoard',
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(10.5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(13),
          child: Column(
            children: [
              SizedBox(
                width: 400,
                child: Form(
                  key: fundAccountKey,
                  child: _buildInputField(
                    label: 'Amount',
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Enter a deposit amount';
                      }
                      return null;
                    },
                    onSaved: (newValue) {
                      amount = newValue!;
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Obx(
                () => ElevatedButton(
                  onPressed: fundAccountFunction,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                  child: Text(fundAccount.isLoading.isTrue
                      ? 'Funding Account ...'
                      : 'Fund wallet'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildInputField({
  required String label,
  required TextInputType keyboardType,
  required String? Function(String?) validator,
  required void Function(String?) onSaved,
}) {
  return TextFormField(
    keyboardType: keyboardType,
    decoration: InputDecoration(
      labelText: label,
    ),
    autocorrect: false,
    textCapitalization: TextCapitalization.none,
    validator: validator,
    onSaved: onSaved,
  );
}
