import 'package:flutter/material.dart';
import 'package:opay_flutter/widget/Login_input.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const SafeArea(
        child: SingleChildScrollView(
          child:Column(children: [
            UserInput()
          ]),
        ),
      ),
      appBar: AppBar(
        title: const Text("Veegil Bank",
            style: TextStyle(
              color: Colors.black,
              fontSize: 19,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            )),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
