import 'dart:convert';

import 'package:dev_tools_test/core/models/transaction_model.dart';
import 'package:flutter/services.dart';

Future<List<TransactionModel>> readFromLocalJson(String key) async {
  final String response = await rootBundle.loadString(key);

  final List<TransactionModel> data = List<TransactionModel>.from(
    json.decode(response).map(
          (x) => TransactionModel.fromJson(x),
        ),
  );

  return data;
}
