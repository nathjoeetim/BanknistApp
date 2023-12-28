import 'package:flutter/material.dart';

const containerStyle = BoxDecoration(
  color: Color.fromARGB(255, 218, 212, 208),
  borderRadius: BorderRadius.all(
    Radius.circular(15),
  ),
);

class FinanceItem extends StatelessWidget {
  const FinanceItem(this.amount,
      {super.key, required this.icons, required this.header});

  final int amount;

  final Icon icons;

  final String header;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      height: 140,
      decoration: containerStyle,
      width: 180,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icons,
              const SizedBox(
                width: 5,
              ),
              Text(
                header,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Your daily return can be withdrawn at any time",
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.normal,
              color: Color.fromARGB(244, 158, 158, 158),
            ),
          ),
          const Spacer(),
          Text(
            "N $amount",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
            ),
          ),
        ],
      ),
    );
  }
}
