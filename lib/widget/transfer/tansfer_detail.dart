import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opay_flutter/bottom_navbar.dart';
import 'package:opay_flutter/data/all_users_model.dart';
import 'package:opay_flutter/data/current_user.dart';
import 'package:opay_flutter/data/transfer_model.dart';
import 'package:opay_flutter/provider/tab_controller.dart';
import 'package:opay_flutter/screen/home_page.dart';
import 'package:opay_flutter/widget/transfer/transfer_history.dart';

class MakeTransferWidget extends StatefulWidget {
  const MakeTransferWidget({Key? key}) : super(key: key);

  @override
  State<MakeTransferWidget> createState() => _MakeTransferWidgetState();
}

class _MakeTransferWidgetState extends State<MakeTransferWidget> {
  var transferKey = GlobalKey<FormState>();
  AccountController transfer = Get.put(AccountController());

  late String phoneNumber;
  late String amount;

  void onSubmitForHandler() async {
    if (transferKey.currentState?.validate() ?? false) {
      transferKey.currentState?.save();

      await transfer.makeTransfer(
        TransferRequest(phoneNumber: phoneNumber, amount: amount),
      );

      await transfer.getAllUsers(
        LoginInputNumber(transfer.getCurrentUsers.value.phoneNumber),
      );

      _showBottomSheet();

      transferKey.currentState?.reset();
    }
  }

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
                          ' ${transfer.getMessage}',
                          style: const TextStyle(
                            color: Color.fromARGB(255, 59, 181, 108),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
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
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recipient Account',
                      style: TextStyle(
                        fontSize: 17,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Form(
                      key: transferKey,
                      child: Column(
                        children: [
                          _buildInputField(
                            label: 'Enter 10 digit account number',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Input can't be left blank";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              phoneNumber = newValue!;
                            },
                          ),
                          _buildInputField(
                            label: 'Amount',
                            keyboardType: TextInputType.number,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return "Please enter a valid amount";
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              amount = newValue!;
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Container(
                    //   height: 30,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: Theme.of(context).errorColor,
                    //     borderRadius: BorderRadius.circular(5),
                    //   ),
                    //   child: const Center(
                    //     child: Text(
                    //       'Unable to make the transfer',
                    //       style: TextStyle(
                    //         fontSize: 17,
                    //         fontStyle: FontStyle.normal,
                    //         fontWeight: FontWeight.bold,
                    //         color: Colors.white,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: onSubmitForHandler,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Obx(
                            () => Container(
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 15, 218, 96),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              width: 300,
                              height: 40,
                              alignment: Alignment.center,
                              child: Text(
                                transfer.getIsLoading.isTrue
                                    ? 'Making Transfer ...'
                                    : 'Next',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const TransferHistoryWidget(),
        ],
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
    validator: validator,
    onSaved: onSaved,
  );
}
