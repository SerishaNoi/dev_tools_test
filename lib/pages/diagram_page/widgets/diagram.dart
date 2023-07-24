import 'package:dev_tools_test/core/styles/app_colors.dart';
import 'package:dev_tools_test/pages/diagram_page/widgets/diagram_sections_info.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class DiagramWidget extends StatefulWidget {
  final double transactionsCount;
  final double refillCount;
  final double withdrawalCount;

  const DiagramWidget({
    super.key,
    required this.transactionsCount,
    required this.refillCount,
    required this.withdrawalCount,
  });

  @override
  State<DiagramWidget> createState() => _DiagramWidgetState();
}

class _DiagramWidgetState extends State<DiagramWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 160,
          width: 160,
          child: PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 40,
              startDegreeOffset: 20,
              sections: [
                PieChartSectionData(
                  value: widget.transactionsCount,
                  showTitle: false,
                  color: AppColors.mainButton,
                ),
                PieChartSectionData(
                  value: widget.refillCount,
                  showTitle: false,
                  color: AppColors.link,
                ),
                PieChartSectionData(
                  value: widget.withdrawalCount,
                  showTitle: false,
                  color: AppColors.violetLight,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 48,
        ),
        const SizedBox(
          height: 160,
          width: 160,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DiagramSectionInfo(
                boxColor: AppColors.mainButton,
                title: 'Транзакции',
              ),
              SizedBox(
                height: 16,
              ),
              DiagramSectionInfo(
                boxColor: AppColors.link,
                title: 'Переводы',
              ),
              SizedBox(
                height: 16,
              ),
              DiagramSectionInfo(
                boxColor: AppColors.violetLight,
                title: 'Пополнения',
              ),
            ],
          ),
        ),
      ],
    );
  }
}
