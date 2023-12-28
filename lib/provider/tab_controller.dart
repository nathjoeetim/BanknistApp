import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:opay_flutter/data/transaction_model.dart';

import '../data/all_users_model.dart';
import '../data/current_user.dart';
import '../data/transfer_datamodel.dart';
import '../data/transfer_model.dart';
import '../data/user_login_input.dart';
import '../data/user_details.dart';

class AccountController extends GetxController {
  List users = <User>[].obs;

  var currentUser = User(
    phoneNumber: "",
    balance: 0,
    created: '2023-12-04T18:55:12.219Z',
  ).obs;

  LoginInputNumber loginNumber = LoginInputNumber("8113779150");

  var hasSuccess = true.obs;
  var isLoading = false.obs;
  var signupMessage = ''.obs;
  var hasError = false.obs;

  RxString get getMessage => signupMessage;

  get getUsers => users;

  Rx<User> get getCurrentUsers => currentUser;

  RxBool get getHasSuccess => hasSuccess;

  RxBool get getIsLoading => isLoading;

  RxBool get getHasError => hasError;

  @override
  void onInit() async {
    super.onInit();
    await getAllUsers(LoginInputNumber(""));
    transactions();
  }

  // Sign user up
  Future<void> signUp(UserSignupInput userSignupInput) async {
    isLoading.value = true;
    const String apiUrl = 'https://bankapi.veegil.com/auth/signup';

    try {
      final Map<String, dynamic> requestData = userSignupInput.toJson();

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode > 200) {
        isLoading.value = false;

        final Map<String, dynamic> error = jsonDecode(response.body);

        signupMessage.value =
            'Error: ${response.statusCode} - ${error['message']}';
        hasSuccess.value = false;
        print('Error: ${response.statusCode}');
        return;
      }

      final SignupResponse signupResponse = SignupResponse.fromJson(
        jsonDecode(response.body),
      );

      // Assign the 'status' to the RxString
      signupMessage.value = signupResponse.status;

      final Map<String, dynamic> success = jsonDecode(response.body);

      signupMessage.value =
          'Success: ${response.statusCode} - ${success['message']}';

      hasSuccess.value = true;
      isLoading.value = false;
    } catch (e) {
      // Handle exceptions here
      signupMessage.value = 'An error occurred during sign up.';
      hasSuccess.value = false;
      isLoading.value = false;
      print('Error: $e');
    }
  }

  // Login
  Future<void> login(UserLoginInput loginInput) async {
    isLoading.value = true;

    const String apiUrl = 'https://bankapi.veegil.com/auth/login';

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(loginInput.toJson()),
      );

      if (response.statusCode > 200) {
        isLoading.value = false;

        final Map<String, dynamic> error = jsonDecode(response.body);

        signupMessage.value =
            'Error: ${response.statusCode} - ${error['message']}';
        hasSuccess.value = false;
        print('Error: ${response.statusCode}');
        return;
      }

      final SignupResponse loginResponse = SignupResponse.fromJson(
        jsonDecode(response.body),
      );

      // Assign the 'status' to the RxString
      signupMessage.value = loginResponse.status;

      final Map<String, dynamic> success = jsonDecode(response.body);

      signupMessage.value =
          'Success: ${response.statusCode} - ${success['message']}';

      hasSuccess.value = true;
      isLoading.value = false;

      // Store login input globally
      loginNumber = LoginInputNumber(loginInput.phoneNumber);
    } catch (e) {
      // Handle exceptions here
      signupMessage.value = 'An error occurred during login!';
      hasSuccess.value = false;
      isLoading.value = false;
      print('Error: $e');
    }
  }

  // View all users
  Future<void> getAllUsers(LoginInputNumber number) async {
    const String apiUrl = 'https://bankapi.veegil.com/accounts/list';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode > 200) {
        final Map<String, dynamic> success = jsonDecode(response.body);

        isLoading.value = false;
        hasSuccess.value = false;
      }

      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      // Parse the entire response using the ApiResponse model
      ApiResponse apiResponse = ApiResponse.fromJson(jsonResponse);

      // Access the list of users from the ApiResponse model
      users = apiResponse.data;

      // Check if the number exists in the list
      bool numberExists =
          users.any((user) => user.phoneNumber == number.phoneNumber);

      if (numberExists) {
        // currentUser = numberExists
        User matchingUser =
            users.firstWhere((user) => user.phoneNumber == number.phoneNumber);

        currentUser.value = User(
          phoneNumber: matchingUser.phoneNumber,
          balance: matchingUser.balance,
          created: matchingUser.created,
        );
      } else {
        print('The number does not exist in the list.');
      }
      // You can access all users directly from the controller without storage
    } catch (e) {
      // Handle exceptions here
      isLoading.value = false;
      hasSuccess.value = false;
      print('Error: $e');
    }
  }

  // Fund account
  Future<void> fundAccount(TransferRequest transferRequest) async {
    isLoading.value = true;
    const String apiUrl = 'https://bankapi.veegil.com/accounts/transfer';

    try {
      final Map<String, dynamic> requestData = {
        'phoneNumber': transferRequest.phoneNumber,
        'amount': transferRequest.amount,
      };

      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(requestData),
      );

      if (response.statusCode > 200) {
        isLoading.value = false;

        // Successfully funded account
        final Map<String, dynamic> success = jsonDecode(response.body);

        signupMessage.value =
            'Error: ${response.statusCode} - ${success['message']}';
        hasSuccess.value = true;
      }
      final Map<String, dynamic> success = jsonDecode(response.body);

      isLoading.value = false;
      signupMessage.value =
          'Success: ${response.statusCode} - ${success['message']}';
      hasSuccess.value = true;
    } catch (e) {
      // Handle exceptions here
      hasError.value = true;
      signupMessage.value =
          'An error occurred during account funding! Try again later. ';
      isLoading.value = false;
      hasSuccess.value = false;

      // Delay for 5 seconds and then reset hasError
      Future.delayed(const Duration(seconds: 5), () {
        hasError.value = false;
      });
    }
  }

  // make a transfer
  Future<void> makeTransfer(TransferRequest transferRequest) async {
    isLoading.value = true;

    const String apiUrl = 'https://bankapi.veegil.com/accounts/transfer';

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'phoneNumber': transferRequest.phoneNumber,
          'amount': transferRequest.amount,
        }),
      );

      if (response.statusCode > 200) {
        isLoading.value = false;

        // Handle error response
        signupMessage.value = 'Error Message: ${response.body}';
      }

      // Successfully transferred
      Map<String, dynamic> responseData = jsonDecode(response.body);
      // String status = responseData['status'];
      String message = responseData['message'];
      int sentAmount = responseData['data']['sent'];

      signupMessage.value = 'Transfer Status: $message , $sentAmount';
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      signupMessage.value = 'Unable to make transfer';
    }
  }

// Transaction
  Future<List<TransactionData>> transactions() async {
    const String apiUrl = 'https://bankapi.veegil.com/transactions';

    try {
      final http.Response response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode > 200) {
        throw Exception('Failed to load data');
      }

      List<dynamic> jsonList = json.decode(response.body)['data'];

      List<TransactionData> transactionsList =
          jsonList.map((json) => TransactionData.fromJson(json)).toList();

      return transactionsList.reversed.toList();
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
