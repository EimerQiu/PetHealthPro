import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pethealthpro/models/activity.dart';

class ActivityHistoryCard extends StatelessWidget {
  final List<Activity> activities;

  ActivityHistoryCard({required this.activities});

  List<BarChartGroupData> _generateChartData() {
    final sampleData = [
      {'active': 8.0, 'sleep': 16.0},
      {'active': 9.0, 'sleep': 15.0},
      {'active': 7.0, 'sleep': 17.0},
      {'active': 10.0, 'sleep': 14.0},
      {'active': 6.0, 'sleep': 18.0},
      {'active': 4.0, 'sleep': 20.0},
      {'active': 5.0, 'sleep': 19.0},
    ];

    List<BarChartGroupData> chartData = [];
    for (int i = 0; i < sampleData.length; i++) {
      chartData.add(
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
                y: sampleData[i]['active']!, colors: [Colors.green]),
            BarChartRodData(y: sampleData[i]['sleep']!, colors: [Colors.blue]),
          ],
        ),
      );
    }

    return chartData;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Activity History',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Green: Active Time, Blue: Sleep Time'),
            SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  barGroups: _generateChartData(),
                  barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    bottomTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (BuildContext context, double value) =>
                          const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      getTitles: (double value) {
                        return 'D${value.toInt() + 1}';
                      },
                      margin: 8,
                    ),
                    leftTitles: SideTitles(
                      showTitles: true,
                      getTextStyles: (BuildContext context, double value) =>
                          const TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                      ),
                      interval: 2,
                      reservedSize: 20,
                    ),
                  ),
                  gridData: FlGridData(
                      drawVerticalLine: false, drawHorizontalLine: false),
                  borderData: FlBorderData(show: false),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
