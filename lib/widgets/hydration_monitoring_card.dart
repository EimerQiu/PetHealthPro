import 'package:flutter/material.dart';
import 'hydration_chart.dart';
import '../models/hydration_data.dart';

class HydrationMonitoringCard extends StatelessWidget {
  final List<HydrationData> hydrationData;

  HydrationMonitoringCard({required this.hydrationData});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hydration Monitoring',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            Container(
              height: 200,
              child: HydrationChart(hydrationData: hydrationData),
            ),
          ],
        ),
      ),
    );
  }
}
