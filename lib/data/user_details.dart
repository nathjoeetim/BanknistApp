class SignupResponse {
  String status;
  String message;
  SignupData data;

  SignupResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory SignupResponse.fromJson(Map<String, dynamic> json) {
    return SignupResponse(
      status: json['status'],
      message: json['message'],
      data: SignupData.fromJson(json['data'] ?? const {}),
    );
  }
}

class SignupData {
  String phoneNumber;
  DateTime created;

  SignupData({
    required this.phoneNumber,
    required this.created,
  });

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
      phoneNumber: json['phoneNumber'] ?? '',
      created: DateTime.tryParse(json['created'] ?? '') ?? DateTime.now(),
    );
  }
}

// class for signup input
class UserSignupInput {
  final String phoneNumber;
  final String password;

  UserSignupInput({
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
