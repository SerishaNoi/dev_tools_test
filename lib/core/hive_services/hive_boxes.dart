import 'package:dev_tools_test/core/models/transaction_model.dart';
import 'package:hive/hive.dart';

class Boxes {
  static Box<TransactionModel> getTransactionsBox() => Hive.box<TransactionModel>("transactions");
}
