class QrCodeDataModel {
  String? code;

  QrCodeDataModel({
    required this.code,
  });

  QrCodeDataModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    return data;
  }
}
