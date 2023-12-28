import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../data/transaction_model.dart';
import '../../provider/tab_controller.dart';
import 'package:intl/intl.dart';

class TransferHistoryWidget extends StatefulWidget {
  const TransferHistoryWidget({super.key});

  @override
  State<TransferHistoryWidget> createState() => _TransferHistoryWidgetState();
}

class _TransferHistoryWidgetState extends State<TransferHistoryWidget> {
  AccountController transactions = Get.put(AccountController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TransactionData>>(
      future: transactions.transactions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          List<TransactionData> transactionsList = snapshot.data!;

          return SizedBox(
            width: double.infinity,
            child: Card(
              margin: const EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(11),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Recent',
                            style: TextStyle(
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 15, 218, 96),
                            ),
                          ),
                          Icon(
                            Icons.search_rounded,
                            color: Color.fromARGB(255, 15, 218, 96),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.custom(
                        reverse: false, // Reverse the order
                        childrenDelegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            TransactionData transaction =
                                transactionsList[index];

                            final transactionColor =
                                transaction.type == 'credit'
                                    ? Colors.green
                                    : Colors.red;

                            String dateTimeString = transaction.created;
                            DateTime dateTime = DateTime.parse(dateTimeString);
                            String formattedDateTime =
                                DateFormat.yMMMMd().add_jms().format(dateTime);

                            final transactionType = transaction.type == 'credit'
                                ? transaction.amount
                                : '-${transaction.amount}';

                            return Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: Colors.white70,
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: transactionColor,
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(50),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        transaction.type.toString(),
                                        style: const TextStyle(
                                          fontSize: 17,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                      ),
                                      Text(
                                        transaction.phoneNumber,
                                        style: const TextStyle(
                                          fontSize: 10,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black45,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '₦ ${transactionType.toString()}',
                                        style: TextStyle(
                                          fontSize: 17,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: transactionColor,
                                        ),
                                      ),
                                      Text(
                                        formattedDateTime,
                                        style: TextStyle(
                                          fontSize: 8,
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.bold,
                                          color: transactionColor,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                          childCount: transactionsList.length,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
