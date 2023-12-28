class User {
  final String phoneNumber;
  final double balance;
  final String created;

  User({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      phoneNumber: json['phoneNumber'] ?? '',
      balance: (json['balance'] ?? 0).toDouble(),
      created: json['created'] ?? '',
    );
  }
}

class ApiResponse {
  final String status;
  final String message;
  final List<User> data;

  ApiResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      status: json['status'] ?? '',
      message: json['message'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((userData) => User.fromJson(userData))
              .toList() ??
          [],
    );
  }
}
