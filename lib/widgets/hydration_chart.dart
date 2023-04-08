import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import '../models/hydration_data.dart';

class HydrationChart extends StatelessWidget {
  final List<HydrationData> hydrationData;

  HydrationChart({required this.hydrationData});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: 6,
        minY: 0,
        maxY: 1200,
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              return hydrationData[value.toInt()].day;
            },
          ),
          leftTitles: SideTitles(showTitles: false),
        ),
        borderData: FlBorderData(show: false),
        lineTouchData: LineTouchData(enabled: false),
        lineBarsData: [
          LineChartBarData(
            spots: List.generate(
              hydrationData.length,
              (index) => FlSpot(
                index.toDouble(),
                hydrationData[index].amount.toDouble(),
              ),
            ),
            isCurved: false,
            colors: [Colors.blue],
            dotData: FlDotData(show: true),
          ),
        ],
      ),
    );
  }
}
