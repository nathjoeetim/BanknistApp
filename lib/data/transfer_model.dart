class TransferRequest {
  final String phoneNumber;
  final String amount;

  TransferRequest({required this.phoneNumber, required this.amount});

  Map<String, dynamic> toJson() {
    return {
      "phoneNumber": phoneNumber,
      "amount": amount,
    };
  }
}
