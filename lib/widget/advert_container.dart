import 'package:flutter/material.dart';

class AdvertWidget extends StatelessWidget {
  const AdvertWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key:const Key("test"),
      child: InkWell(
        onTap: () {},
        child: Container(
          height: 80,
          margin: const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 5),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:
                        const Color.fromARGB(207, 59, 181, 108).withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  child: const Icon(
                    Icons.accessibility_sharp,
                    color: Color.fromARGB(255, 59, 181, 108),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Refer and earn",
                      style: TextStyle(
                          fontSize: 13, color: Color.fromARGB(124, 31, 31, 31)),
                    ),
                     SizedBox(height: 10),
                    Text(
                      " Earn 800 cashback per referral ",
                      style: TextStyle(
                          fontSize: 11, color: Color.fromARGB(124, 86, 84, 84)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
