import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/all_users_model.dart';
import '../provider/tab_controller.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({super.key});

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    AccountController currentUserController = Get.find();


    return Padding(
      padding:const  EdgeInsets.only(
        top: 20.0,
        bottom: 8.0,
        left: 20,
        right: 20,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "Welcome ${currentUserController.getCurrentUsers.value.phoneNumber}",
              style:const  TextStyle(
                fontSize: 17,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.headset_mic_rounded,
            size: 20,
            color: Colors.black,
          )
        ],
      ),
    );
  }
}
