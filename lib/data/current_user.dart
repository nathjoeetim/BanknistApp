class LoginInputNumber {
  final String phoneNumber;

  LoginInputNumber( this.phoneNumber);
}

class UserData {
  final String phoneNumber;
  final String balance;
  final String created;

  UserData({
    required this.phoneNumber,
    required this.balance,
    required this.created,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      phoneNumber: json['phoneNumber'] ?? '',
      balance: json['balance'] ?? 0,
      created: json['created'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'balance': balance,
      'created': created,
    };
  }
}
