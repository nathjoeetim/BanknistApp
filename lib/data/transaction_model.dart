class Transaction {
  final String status;
  final List<TransactionData> data;

  Transaction({required this.status, required this.data});

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      status: json['status'] ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((item) => TransactionData.fromJson(item))
              .toList() ??
          [],
    );
  }
}

class TransactionData {
  final String type;
  final dynamic amount;
  final String phoneNumber;
  final String created;

  TransactionData({
    required this.type,
    required this.amount,
    required this.phoneNumber,
    required this.created,
  });

  factory TransactionData.fromJson(Map<String, dynamic> json) {
    return TransactionData(
      type: json['type'] ?? '',
      amount: json['amount'] ?? 0,
      phoneNumber: json['phoneNumber'] ?? '',
      created: json['created'] ?? '',
    );
  }
}
