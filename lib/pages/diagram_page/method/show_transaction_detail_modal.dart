import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:dev_tools_test/pages/widgets/main_button.dart';
import 'package:flutter/material.dart';

void show({
  required BuildContext context,
  required String transactionData,
  required String transactionSum,
  required String transactionComission,
  required String total,
  required String transactionNumber,
  required String transactionType,
  required Function() onPressed,
}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Container(
        color: AppColors.bgCard,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 10,
                right: 20,
                left: 20,
              ),
              child: Text(
                'Детали транзакции $transactionNumber',
                style: const TextStyle(
                  fontSize: 28,
                  color: AppColors.text,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: AppColors.text, width: 2),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    transactionType,
                    style: const TextStyle(
                      fontSize: 28,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    'Дата транзакции: $transactionData',
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    'Сумма: $transactionSum',
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    'Комиссия: $transactionComission',
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    'Итого: $total',
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.text,
                    ),
                  ),
                  Text(
                    'Номер транзакции: $transactionNumber',
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColors.text,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: MainButton(
                title: 'Удалить транзакцию',
                titleSize: 20,
                titleColor: AppColors.text,
                onPressed: onPressed,
              ),
            ),
          ],
        ),
      );
    },
  );
}
