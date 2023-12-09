// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../models/qr_code_data_model.dart';

class QrCodeWidget extends StatelessWidget {
  final String code;
  const QrCodeWidget({
    super.key,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: QrImageView(
        padding: EdgeInsets.zero,
        gapless: false,
        data: json.encode(
          QrCodeDataModel(code: code).toJson(),
        ),
        version: QrVersions.auto,
        eyeStyle:
            const QrEyeStyle(color: Colors.black, eyeShape: QrEyeShape.square),
        dataModuleStyle: const QrDataModuleStyle(
          color: Colors.black,
          dataModuleShape: QrDataModuleShape.square,
        ),
        backgroundColor: Colors.white,
        size: 200.0,
      ),
    );
  }
}
