class TransferResponse {
  late String status;
  late String message;
  late TransferData data;

  TransferResponse({required this.status, required this.message, required this.data});

  TransferResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = TransferData.fromJson(json['data']);
  }
}

class TransferData {
  late int sent;

  TransferData({required this.sent});

  TransferData.fromJson(Map<String, dynamic> json) {
    sent = json['sent'];
  }
}
