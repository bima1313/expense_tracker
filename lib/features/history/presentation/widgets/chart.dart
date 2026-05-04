import 'package:expense_tracker/core/themes/app_colors.dart';
import 'package:expense_tracker/core/themes/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widget_previews.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.title, required this.label});
  final String title;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 206, 206, 206),
        borderRadius: .all(.circular(16.0)),
      ),
      child: Padding(
        padding: const .all(16.0),
        child: Column(
          mainAxisSize: .min,
          spacing: 32.0,
          children: [
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.black,
                    fontWeight: .bold,
                    letterSpacing: 1.5,
                  ),
                ),
                Row(
                  spacing: 8.0,
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: AppColors.beauVert,
                        borderRadius: const .all(.circular(36.0)),
                      ),
                    ),
                    Text(
                      label,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: Colors.black,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(show: false),
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    topTitles: const AxisTitles(),
                    leftTitles: const AxisTitles(),
                    rightTitles: const AxisTitles(),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 3,
                        reservedSize: 30,
                        getTitlesWidget: (value, meta) {
                          String text = switch (value.toInt()) {
                            1 => "Jan",
                            2 => "Feb",
                            3 => "March",
                            4 => "April",
                            5 => "May",
                            6 => "June",
                            7 => "July",
                            8 => "August",
                            9 => "Sep",
                            10 => "Oct",
                            11 => "Nov",
                            12 => "Des",
                            _ => "",
                          };
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(
                              text,
                              style: Theme.of(context).textTheme.labelLarge
                                  ?.copyWith(
                                    color: const Color.fromARGB(
                                      255,
                                      34,
                                      34,
                                      34,
                                    ),
                                    fontWeight: .w600,
                                    letterSpacing: 1.0,
                                  ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      barWidth: 4.0,
                      dotData: const FlDotData(show: false),
                      isStrokeCapRound: true,
                      color: AppColors.beauVert,
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: const LinearGradient(
                          begin: .topCenter,
                          end: .bottomCenter,
                          colors: [
                            Color.fromARGB(100, 23, 97, 97),
                            Color.fromARGB(255, 206, 206, 206),
                          ],
                        ),
                      ),
                      spots: [
                        FlSpot(1, 1),
                        FlSpot(2, 2),
                        FlSpot(3, 3),
                        FlSpot(4, 4),
                        FlSpot(5, 5),
                        FlSpot(6, 3),
                        FlSpot(7, 6),
                        FlSpot(8, 9),
                        FlSpot(9, 5),
                        FlSpot(10, 7),
                        FlSpot(11, 5),
                      ],
                      isCurved: true,
                      curveSmoothness: 0.5,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

PreviewThemeData lightTheme() =>
    PreviewThemeData(materialLight: AppTheme.lightTheme);
@Preview(size: Size(360, 800), name: "Chart Widget Preview", theme: lightTheme)
Widget chartWidgetPreview() {
  return Scaffold(
    appBar: AppBar(title: Text("Expense Tracker")),
    body: const Chart(title: "Spending Velocity", label: "Outflow"),
  );
}
