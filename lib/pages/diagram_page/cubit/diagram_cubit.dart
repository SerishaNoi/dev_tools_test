import 'package:dev_tools_test/core/hive_services/hive_services.dart';
import 'package:dev_tools_test/core/methods/read_from_local_json.dart';
import 'package:dev_tools_test/core/models/transaction_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

part 'diagram_state.dart';
part 'diagram_cubit.freezed.dart';

class DiagramCubit extends Cubit<DiagramState> {
  DiagramCubit() : super(const DiagramState.initial());

  int transferCount = 0;
  int refillCount = 0;
  int withdrawalCount = 0;

  final HiveServices hiveServices = HiveServices();

  void init() async {
    final Box<TransactionModel> transactionBox =
        await Hive.openBox<TransactionModel>("transactions");
    if (transactionBox.values.isEmpty) {
      // При первом старте приложения для демонстрации работы:
      // Если данных в боксе нет, тогда получаем данные из локаьного Json и кладем в бокс
      List<TransactionModel> data = await readFromLocalJson('assets/jsons/transactions_list.json');

      // Кладем данные в бокс через цикл, что бы потом получать значения по ключу номера транзакции
      for (var i = 0; i < data.length; i++) {
        transactionBox.put(data[i].transactionsNumber, data[i]);
      }

      _countTransactionTypes(transactionBox: transactionBox);

      emit(
        DiagramState.loaded(
          transactionBox.values.toList(),
          transfer: transferCount,
          refill: refillCount,
          withdrawal: withdrawalCount,
        ),
      );

      print(transactionBox.keys);
    } else if (transactionBox.values.isNotEmpty) {
      _countTransactionTypes(transactionBox: transactionBox);

      emit(
        DiagramState.loaded(
          transactionBox.values.toList(),
          transfer: transferCount,
          refill: refillCount,
          withdrawal: withdrawalCount,
        ),
      );
      print(transactionBox.keys);

      print("FSFDSDLDSSDD ${transactionBox.values.toList().first.commission}");
    }
  }

  void deleteTransaction({required String transactionNumber}) async {
    final Box<TransactionModel> transactionBox =
        await Hive.openBox<TransactionModel>("transactions");

    await transactionBox.delete(transactionNumber);

    _countTransactionTypes(transactionBox: transactionBox);

    emit(
      DiagramState.loaded(
        transactionBox.values.toList(),
        transfer: transferCount,
        refill: refillCount,
        withdrawal: withdrawalCount,
      ),
    );
  }

  _countTransactionTypes({required Box<TransactionModel> transactionBox}) {
    transferCount = transactionBox.values
        .where((element) => element.operationType == "TRANSFER")
        .toList()
        .length;

    refillCount =
        transactionBox.values.where((element) => element.operationType == "REFILL").toList().length;

    withdrawalCount = transactionBox.values
        .where((element) => element.operationType == "WITHDRAWAL")
        .toList()
        .length;
  }
}
