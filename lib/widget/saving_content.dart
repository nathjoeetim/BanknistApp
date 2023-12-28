import 'package:flutter/material.dart';
import 'package:opay_flutter/widget/finance_widget/bottom_finance_item.dart';

const containerStyle = BoxDecoration(
  color: Color.fromARGB(255, 218, 212, 208),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

class SavingDetails extends StatelessWidget {
  const SavingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        InkWell(
          onTap: () {},
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
          splashColor: const Color.fromARGB(255, 216, 194, 218),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            height: 170,
            margin:
                const EdgeInsets.only(right: 10, left: 10, top: 20, bottom: 5),
            decoration: containerStyle,
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.business_center_sharp, color: Colors.blue),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Owealth",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Your daily return can be withdrawn at any time",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(244, 158, 158, 158),
                  ),
                ),
                Spacer(),
                Text(
                  "N 490",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(right: 9.8, left: 9.8, bottom: 8.0, top: 8.0),
          child: Row(
            children: [
              FinanceItem(
                250,
                icons: Icon(Icons.connected_tv_sharp, color: Colors.blue),
                header: "Target",
              ),
              SizedBox(
                width: 10,
              ),
              FinanceItem(
                250,
                icons: Icon(Icons.wallet_rounded, color: Colors.blue),
                header: "SafeBox",
              ),
            ],
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(right: 9.8, left: 9.8, bottom: 8.0, top: 8.0),
          child: Row(
            children: [
              FinanceItem(
                1250,
                icons: Icon(Icons.savings, color: Colors.blue),
                header: "Savings",
              ),
              SizedBox(
                width: 10,
              ),
              FinanceItem(
                2250,
                icons: Icon(Icons.gps_fixed_sharp, color: Colors.blue),
                header: "Fixed Deposit",
              ),
            ],
          ),
        ),
        const Padding(
          padding:
              EdgeInsets.only(right: 9.8, left: 9.8, bottom: 8.0, top: 8.0),
          child: Row(
            children: [
              FinanceItem(
                1250,
                icons: Icon(Icons.savings, color: Colors.blue),
                header: "Savings",
              ),
            ],
          ),
        )
      ],
    );
  }
}
