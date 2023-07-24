import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:dev_tools_test/pages/authorization_page/cubit/authorization_cubit.dart';
import 'package:dev_tools_test/pages/diagram_page/cubit/diagram_cubit.dart';
import 'package:dev_tools_test/pages/diagram_page/method/show_transaction_detail_modal.dart';
import 'package:dev_tools_test/pages/diagram_page/widgets/diagram.dart';
import 'package:dev_tools_test/pages/diagram_page/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiagramPage extends StatefulWidget {
  const DiagramPage({super.key});

  @override
  State<DiagramPage> createState() => _DiagramPageState();
}

class _DiagramPageState extends State<DiagramPage> {
  @override
  void initState() {
    DiagramCubit().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DiagramCubit>(
      create: (context) => DiagramCubit()..init(),
      child: BlocBuilder<DiagramCubit, DiagramState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.purpleHard,
              ),
              child: CircularProgressIndicator(),
            ),
            loaded: (transactions, transfer, refill, withdrawal) => WillPopScope(
              onWillPop: () async {
                context.read<AuthorizationCubit>().logOut();

                return await false;
              },
              child: SafeArea(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: Scaffold(
                      backgroundColor: AppColors.purpleHard,
                      body: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.violetLight,
                                      borderRadius: BorderRadius.circular(12)),
                                  height: 40,
                                  child: TextButton.icon(
                                    label: const Text(
                                      'Выйти',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    icon: const Icon(Icons.logout, color: AppColors.no),
                                    onPressed: () {
                                      context.read<AuthorizationCubit>().logOut();
                                    },
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            DiagramWidget(
                              refillCount: refill!.toDouble(),
                              transactionsCount: transfer!.toDouble(),
                              withdrawalCount: withdrawal!.toDouble(),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 18),
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(color: AppColors.white, width: 1.4),
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'Список ваших операций:',
                              style: TextStyle(
                                fontSize: 20,
                                color: AppColors.bgCard,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Expanded(
                              child: ListView.separated(
                                padding: const EdgeInsets.only(bottom: 30),
                                separatorBuilder: (context, index) => const SizedBox(
                                  height: 10,
                                ),
                                itemCount: transactions.length,
                                itemBuilder: (context, index) {
                                  return TransactionCard(
                                    onTap: () {
                                      show(
                                        context: context,
                                        total: transactions[index].total,
                                        transactionComission: transactions[index].commission,
                                        transactionData: transactions[index].transactionData,
                                        transactionNumber: transactions[index].transactionsNumber,
                                        transactionSum: transactions[index].sum,
                                        transactionType: transactions[index].operationType,
                                        onPressed: () {
                                          context.read<DiagramCubit>().deleteTransaction(
                                              transactionNumber:
                                                  transactions[index].transactionsNumber);
                                          Navigator.pop(context);
                                        },
                                      );
                                    },
                                    transactionNumber: transactions[index].transactionsNumber,
                                    transactionSumm: transactions[index].sum,
                                    transactionType: transactions[index].operationType.toString(),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            orElse: () => const SizedBox(),
          );
        },
      ),
    );
  }
}
