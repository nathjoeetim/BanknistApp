import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:local_auth/local_auth.dart';
import 'package:get/get.dart';
import 'package:opay_flutter/bottom_navbar.dart';
import 'package:opay_flutter/data/current_user.dart';
import 'package:opay_flutter/data/user_details.dart';
import 'package:opay_flutter/data/user_login_input.dart';
import 'package:opay_flutter/provider/tab_controller.dart';

class UserInput extends StatefulWidget {
  const UserInput({super.key});

  @override
  State<UserInput> createState() => _UserInputState();
}

class _UserInputState extends State<UserInput> {
  AccountController authUser = Get.put(AccountController());

  final formKey = GlobalKey<FormState>();
  late String phoneNumberInput;
  late String passwordInput;
  late bool isLoading = false;

  late bool signUp = false;
  final LocalAuthentication auth = LocalAuthentication();

  void submitFormHandler() async {
    final isValid = formKey.currentState!.validate();
    // go to the login page

    if (isValid) {
      formKey.currentState?.save();

      // Perform login/signup logic
      if (signUp) {
        await authUser.signUp(
          UserSignupInput(
            phoneNumber: phoneNumberInput,
            password: passwordInput,
          ),
        );
        _showBottomSheet();

        setState(() {
          signUp = false;
        });
      } else {
        await authUser.login(
          UserLoginInput(
            phoneNumber: phoneNumberInput,
            password: passwordInput,
          ),
        );

        authUser.getAllUsers(
          LoginInputNumber(phoneNumberInput),
        );

        _showBottomSheet();

        Future.delayed(const Duration(seconds: 2), () {
          if (authUser.getHasSuccess.isTrue) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const BottomNavigation(),
            ));
          }
        });
      }

      formKey.currentState?.reset();
    }
  }

  void _showBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext builderContext) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Center(
                  child: Column(
                    children: [
                      Text(
                        ' ${authUser.getMessage}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 59, 181, 108),
                        ),
                      ),
                    ],
                  ),
                ),

              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 700,
        padding: const EdgeInsets.all(15),
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Column(
          children: [
            const Text(
              "Welcome back!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "********150",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 7,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildInputField(
                      label: 'Phone number',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Please enter a valid phone number";
                        }
                        if (value.length != 11) {
                          return "Input 11 digit phone number";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        phoneNumberInput = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    _buildInputField(
                      label: 'Password',
                      keyboardType: TextInputType.emailAddress,
                      obscureText: true,
                      validator: (value) {
                        if (value == null ||
                            value.trim().isEmpty ||
                            value.length < 4) {
                          return "Please enter a valid password";
                        }
                        return null;
                      },
                      onSaved: (newValue) {
                        passwordInput = newValue!;
                      },
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Obx(() => authUser.getIsLoading.isFalse
                        ? ElevatedButton(
                            onPressed: submitFormHandler,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context)
                                  .colorScheme
                                  .primaryContainer,
                            ),
                            child: Text(signUp ? 'Signup' : "Login"),
                          )
                        : Text('')),
                    Obx(
                      () => Center(
                        child: Visibility(
                          visible: authUser.getIsLoading.isTrue,
                          child: LoadingAnimationWidget.newtonCradle(
                            color: const Color.fromARGB(255, 59, 181, 108),
                            size: 50,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          signUp = !signUp;
                        });
                      },
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            signUp = !signUp;
                          });
                        },
                        child: Text(!signUp
                            ? 'Create an account'
                            : "Have an account? Login"),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                if (!signUp)
                  const Text(
                    "Login with fingerprint",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 8,
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                const SizedBox(
                  height: 4,
                ),
                if (!signUp)
                  InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.fingerprint_outlined,
                      size: 40,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.message,
                      color: Colors.grey,
                      size: 11,
                    ),
                    Text(
                      " Need help? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Check with our support team",
                      style: TextStyle(
                        color: Color.fromARGB(255, 59, 181, 108),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextInputType keyboardType,
    bool obscureText = false,
    required String? Function(String?) validator,
    required void Function(String?) onSaved,
  }) {
    return TextFormField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
      ),
      obscureText: obscureText,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
