import 'package:flutter/material.dart';
import '../models/pet.dart';
import '../models/activity.dart';
import 'widgets/pet_info_card.dart';
import 'widgets/exercise_goals_card.dart';
import 'widgets/activity_history_card.dart';
import 'widgets/nutrition_tracking_card.dart';
import 'widgets/hydration_chart.dart';
import 'models/hydration_data.dart';
import 'widgets/hydration_monitoring_card.dart';

void main() {
  runApp(PetHealthApp());
}

class PetHealthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Health App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatelessWidget {
  final List<HydrationData> hydrationData = [
    HydrationData('Mon', 800),
    HydrationData('Tue', 896),
    HydrationData('Wed', 783),
    HydrationData('Thu', 1092),
    HydrationData('Fri', 901),
    HydrationData('Sat', 1036),
    HydrationData('Sun', 849),
  ];
  final Pet pet =
      Pet(name: 'Candy', sex: 'Female', age: 7, type: 'Labrador', weight: 30.0);
  final List<Activity> activities = [
    Activity(
        date: DateTime.now().subtract(Duration(days: 1)),
        steps: 3000,
        activeTime: 120,
        sleepTime: 720,
        calories: 500,
        weight: 30.0),
    Activity(
        date: DateTime.now().subtract(Duration(days: 2)),
        steps: 3500,
        activeTime: 150,
        sleepTime: 700,
        calories: 520,
        weight: 30.5),
    // Add more sample activity data here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Health Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PetInfoCard(pet: pet),
              ExerciseGoalsCard(activities: activities, goalSteps: 3000),
              ActivityHistoryCard(activities: activities),
              NutritionTrackingCard(activities: activities),
              HydrationMonitoringCard(hydrationData: hydrationData),
            ],
          ),
        ),
      ),
    );
  }
}
