import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opay_flutter/provider/tab_controller.dart';
import 'package:opay_flutter/screen/add_money_widget.dart';
import 'package:opay_flutter/screen/transfer_screen.dart';

import '../../data/all_users_model.dart';

const textDeco = TextStyle(
  color: Colors.white,
  fontStyle: FontStyle.normal,
  fontSize: 11,
);

class HomeCard extends StatefulWidget {
  const HomeCard({super.key});

  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  AccountController currentUserController = Get.put(AccountController());

  @override
  void initState() {
    super.initState();
    // Retrieve the existing instance of AccountController
    currentUserController = Get.find<AccountController>();
  }

  void onGoToAnotherPageHandeler() {
    // print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 170,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 5),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 59, 181, 108),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Available Balance",
                style: textDeco,
              ),
              Spacer(),
              Text(
                "Transaction History",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 11,
                  decoration: TextDecoration.underline,
                  decorationColor: Colors.white,
                  // decorationThickness: 2
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Obx(
                () {
                  double balance =
                      currentUserController.getCurrentUsers.value.balance;
                  return Text(
                    '₦ $balance',
                    style: const TextStyle(
                      fontSize: 23,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  );
                },
              ),
              const Text(
                "Cashback N0.0 ",
                style: TextStyle(
                  fontSize: 10,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AddMoneyWidget(),
                        ),
                      ),
                      child: Column(
                        children: [
                          Material(
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: const Color.fromARGB(207, 59, 181, 108)
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Add money",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const TransferScreenWidget(),
                        ),
                      ),
                      child: Column(
                        children: [
                          Material(
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Center(
                                child: Icon(
                                  Icons.compare_arrows,
                                  color: const Color.fromARGB(207, 59, 181, 108)
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Text(
                            "Transfer Money",
                            style: TextStyle(color: Colors.white, fontSize: 11),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Material(
                          child: InkWell(
                            onTap: () {},
                            child: SizedBox(
                              height: 25,
                              width: 25,
                              child: Center(
                                child: Icon(
                                  Icons.double_arrow,
                                  color: const Color.fromARGB(207, 59, 181, 108)
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Withdraw",
                          style: TextStyle(color: Colors.white, fontSize: 11),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
