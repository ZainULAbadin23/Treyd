import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/app_colors.dart';
import 'app_text_style.dart';

class CustomCryptoChart extends StatelessWidget {
  const CustomCryptoChart({super.key});

  @override
  Widget build(BuildContext context) {
    final data = LineData();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 12 / 6,
          child: LineChart(
            LineChartData(
              lineTouchData: LineTouchData(
                touchTooltipData: LineTouchTooltipData(
                  tooltipRoundedRadius: 10,
                  tooltipBgColor: Colors.black87,
                  getTooltipItems: (touchedSpots) {
                    return touchedSpots.map((LineBarSpot touchedSpot) {
                      return LineTooltipItem(
                        '\$${touchedSpot.y}',
                        AppTextStyle.textStyleSmallNormal.copyWith(
                            fontSize: 12.sp,
                            color: AppColors.whiteColor,
                            fontFamily: FontsFamily.OpenSansRegular),
                      );
                    }).toList();
                  },
                ),
                handleBuiltInTouches: true,
              ),
              gridData: FlGridData(
                show: true,
                getDrawingHorizontalLine: (value) {
                  return FlLine(
                    color: AppColors.greyColor200, // Adjust the color as needed
                    strokeWidth: 1, // Adjust the width as needed
                  );
                },
                getDrawingVerticalLine: (value) {
                  return FlLine(
                    color: AppColors.greyColor200, // Adjust the color as needed
                    strokeWidth: 1, // Adjust the width as needed
                  );
                },
              ),
              titlesData: FlTitlesData(
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(
                    getTitlesWidget: (double value, TitleMeta meta) {
                      return data.RightTitle[value.toInt()] != null
                          ? Text(data.RightTitle[value.toInt()].toString(),
                              style: AppTextStyle.textStyleSmallNormal.copyWith(
                                  fontFamily: FontsFamily.OpenSansRegular,
                                  color: AppColors.greyColor500))
                          : const SizedBox();
                    },
                    showTitles: true,
                    interval: 1,
                    reservedSize: 40,
                  ),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: false,
                  ),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(),
                ),
              ),
              borderData: FlBorderData(show: false),
              lineBarsData: [
                LineChartBarData(
                  color: AppColors.primaryColor,
                  barWidth: 2.5,
                  belowBarData: BarAreaData(
                    show: false,
                  ),
                  dotData: FlDotData(show: false),
                  spots: data.spots,
                )
              ],
              minX: 0,
              maxX: 100,
              minY: 0,
              maxY: 90,
            ),
          ),
        ),
      ],
    );
  }
}

class LineData {
  final spots = const [
    FlSpot(1.0, 3.0),
    FlSpot(4, 6.0),
    FlSpot(6.5, 10.0),
    FlSpot(8.0, 14.0),
    FlSpot(10.5, 12.0),
    FlSpot(12.0, 22.0),
    FlSpot(14.5, 16.0),
    FlSpot(16.0, 19.0),
    FlSpot(18.5, 22.0),
    FlSpot(20.0, 26.0),
    FlSpot(24.5, 17.0),
    FlSpot(22.0, 32.0),
    FlSpot(26.5, 27.0),
    FlSpot(28.0, 27.0),
    FlSpot(30.5, 38.0),
    FlSpot(34.0, 49.0),
    FlSpot(35.5, 59.0),
    FlSpot(36.0, 54.0),
    FlSpot(38.5, 66.0),
    FlSpot(40.0, 55.0),
    FlSpot(42.5, 40.0),
    FlSpot(50.0, 50.0),
    FlSpot(55.5, 60.0),
    FlSpot(60.0, 55.0),
    FlSpot(65.5, 56.0),
    FlSpot(70.0, 60.0),
    FlSpot(75.0, 49.0),
    FlSpot(80.5, 59.0),
    FlSpot(84.0, 54.0),
    FlSpot(86.5, 66.0),
    FlSpot(88.0, 70.0),
    FlSpot(90.5, 72.0),
    FlSpot(92, 74.0),
    FlSpot(93.5, 70.0),
    FlSpot(94.0, 76.0),
    FlSpot(95, 78.0),
    FlSpot(96.0, 80.0),
    FlSpot(95, 85.0),
    FlSpot(96.0, 90.0),
  ];

  final RightTitle = {
    0: '0',
    20: '200',
    40: '400',
    60: '600',
    80: '800',
  };
}
