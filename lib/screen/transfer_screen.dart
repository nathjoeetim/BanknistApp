import 'package:flutter/material.dart';
import 'package:opay_flutter/widget/transfer/tansfer_detail.dart';

class TransferScreenWidget extends StatefulWidget {
  const TransferScreenWidget({Key? key}) : super(key: key);

  @override
  State<TransferScreenWidget> createState() => _TransferScreenWidgetState();
}

class _TransferScreenWidgetState extends State<TransferScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // transfer top bar
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
                    "Make Transfer",
                    style: TextStyle(
                      fontSize: 17,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 40,
              width: double.infinity,
              margin:
                  const EdgeInsets.only(right: 10, left: 10, bottom: 5, top: 5),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.purple.withOpacity(.3),
              ),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb_circle_sharp,
                    color: Colors.purple,
                    size: 20,
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Text(
                    'Free transfer for the day: 3',
                    style: TextStyle(
                      fontSize: 13,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Rest of your content
                    MakeTransferWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
