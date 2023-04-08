class Activity {
  DateTime date;
  int steps;
  int activeTime;
  int sleepTime;
  int calories;
  double weight;

  Activity(
      {required this.date,
      required this.steps,
      required this.activeTime,
      required this.sleepTime,
      required this.calories,
      required this.weight});
}
