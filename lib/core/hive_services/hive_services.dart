import 'package:dev_tools_test/core/hive_services/hive_boxes.dart';
import 'package:dev_tools_test/core/models/transaction_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveServices {
  static Box transactionBox = Boxes.getTransactionsBox();

  void refreshItems() {}

  void getAllTransactions(/* TransactionModel transactionModel */) {
    transactionBox.get('transaction');
  }

  void deleteTransaction(TransactionModel transactionModel) async {
    var key = transactionModel.transactionsNumber;

    await transactionBox.delete(key);
  }
}
