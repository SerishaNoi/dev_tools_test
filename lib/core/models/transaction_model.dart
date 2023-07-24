import 'package:hive/hive.dart';

part 'transaction_model.g.dart';

@HiveType(typeId: 1)
class TransactionModel {
  @HiveField(0)
  final String transactionData;
  @HiveField(1)
  final String sum;
  @HiveField(2)
  final String commission;
  @HiveField(3)
  final String total;
  @HiveField(4)
  final String transactionsNumber;
  @HiveField(5)
  final String operationType;

  TransactionModel({
    required this.transactionData,
    required this.sum,
    required this.commission,
    required this.total,
    required this.transactionsNumber,
    required this.operationType,
  });
  factory TransactionModel.fromJson(Map<String, dynamic> json) => TransactionModel(
        transactionData: json["transactionData"],
        sum: json["sum"],
        commission: json["commission"],
        total: json["total"],
        transactionsNumber: json["transactionsNumber"],
        operationType: json["operationType"],
      );

  Map<String, dynamic> toJson() => {
        "transactionData": transactionData,
        "sum": sum,
        "commission": commission,
        "total": total,
        "transactionsNumber": transactionsNumber,
        "operationType": operationType,
      };
}
