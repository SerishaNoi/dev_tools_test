import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:flutter/material.dart';

class DiagramSectionInfo extends StatelessWidget {
  final Color boxColor;
  final String title;

  const DiagramSectionInfo({
    super.key,
    required this.boxColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 16,
          width: 16,
          color: boxColor,
        ),
        const SizedBox(
          width: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: AppColors.bgCard,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
