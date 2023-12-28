import 'package:flutter/material.dart';
import 'package:opay_flutter/widget/custom-widget/icon_text_btn.dart';

class OtherTransaction extends StatelessWidget {
  const OtherTransaction({super.key});

  void onGoToAnotherPageHandeler() {
    print("Hello");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 160,
      margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              TextIconBtn(
                icon: const Icon(
                  Icons.phone_forwarded_outlined,
                  color: Color.fromARGB(255, 59, 181, 108),
                  size: 20,
                ),
                btnLabel: "Airtime",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
              const Spacer(),
              TextIconBtn(
                icon: const Icon(
                  Icons.phone_android_rounded,
                  color: Color.fromARGB(255, 59, 181, 108),
                ),
                btnLabel: "Data",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
              const Spacer(),
              TextIconBtn(
                icon: const Icon(
                  Icons.sports_basketball,
                  color: Color.fromARGB(255, 59, 181, 108),
                  size: 20,

                ),
                btnLabel: "Betting",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
              const Spacer(),
              TextIconBtn(
                icon: const Icon(
                  Icons.live_tv,
                  color: Color.fromARGB(255, 59, 181, 108),
                  size: 20,

                ),
                btnLabel: "Airtime",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              TextIconBtn(
                icon: const Icon(
                  Icons.lightbulb,
                  color: Color.fromARGB(255, 59, 181, 108),
                ),
                btnLabel: "Electricity",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
              const Spacer(),
              TextIconBtn(
                icon: const Icon(
                  Icons.wifi,
                  color: Color.fromARGB(255, 59, 181, 108),
                ),
                btnLabel: "Airtime",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
              const Spacer(),
              TextIconBtn(
                icon: const Icon(
                  Icons.menu_book_outlined,
                  color: Color.fromARGB(255, 59, 181, 108),
                ),
                btnLabel: "Airtime",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
              const Spacer(),
              TextIconBtn(
                icon: const Icon(
                  Icons.arrow_circle_right,
                  color: Color.fromARGB(255, 59, 181, 108),
                ),
                btnLabel: "Airtime",
                onGoToAnotherPageHandeler: onGoToAnotherPageHandeler,
              ),
            ],
          )
        ],
      ),
    );
  }
}
