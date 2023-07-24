import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  final String transactionType;
  final String transactionNumber;
  final String transactionSumm;
  final Function() onTap;

  const TransactionCard({
    super.key,
    required this.transactionType,
    required this.transactionNumber,
    required this.transactionSumm,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.white, width: 2),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transactionType,
                  style: const TextStyle(
                      fontSize: 28, color: AppColors.violetHard, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Номер транзакции: ${transactionNumber}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Сумма транзакции: ${transactionSumm}',
                  style: const TextStyle(
                    fontSize: 20,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
