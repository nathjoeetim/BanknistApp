
class UserLoginInput {
  final String phoneNumber;
  final String password;

  UserLoginInput({
    required this.phoneNumber,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'password': password,
    };
  }
}
