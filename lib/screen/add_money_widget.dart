import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../provider/tab_controller.dart';
import '../widget/direct_deposit_input.dart';

class AddMoneyWidget extends StatefulWidget {
  const AddMoneyWidget({super.key});

  @override
  State<AddMoneyWidget> createState() => _AddMoneyWidgetState();
}

class _AddMoneyWidgetState extends State<AddMoneyWidget> {
  AccountController currentUserController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            //   transfer top bar
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_outlined,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Fund your account",
                    style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 130,
              width: 400,
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(children: [
                    const Text(
                      'Make transfer to fund your account',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Obx(
                      () =>  SelectableText(
                        currentUserController.getCurrentUsers.value.phoneNumber,
                        style: const TextStyle(
                          color: Colors.black,
                          fontStyle: FontStyle.normal,
                          fontSize: 19,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const SelectableText(
                      'Veegil bank',
                      style: TextStyle(
                        color: Colors.black,
                        fontStyle: FontStyle.normal,
                        fontSize: 19,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Fund wallet from bank',
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const DepositInput()
          ],
        ),
      ),
    );
  }
}
