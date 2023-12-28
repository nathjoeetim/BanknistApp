import 'package:flutter/material.dart';

class TextIconBtn extends StatelessWidget {
  const TextIconBtn(
      {super.key,
      required this.icon,
      required this.btnLabel,
      required this.onGoToAnotherPageHandeler});

  final Icon icon;
  final String btnLabel;
  final Function() onGoToAnotherPageHandeler;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(207, 59, 181, 108).withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8.0),
            child: Material(
              child: InkWell(
                onTap: () {},
                child: Container(
                  color: const Color.fromARGB(207, 59, 181, 108).withOpacity(0.3),
                  height: 30,
                  child:  Center(
                    child: icon ,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 2),
        // Add this line for spacing between the icon and text
        Text(
          btnLabel,
          style: const TextStyle(color: Colors.black54, fontSize: 10),
          textAlign:
              TextAlign.center, // Add this line to center the text horizontally
        ),
      ],
    );
  }
}
