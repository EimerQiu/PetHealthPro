import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pethealthpro/widgets/step_counter.dart'; // Replace with the path to the file containing the countStepsMain function

void main() {
  group('Step counting test', () {
    FlutterDriver? driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });

    test('Test step counting with local dataset file', () async {
      // Read the local dataset file
      // String fileName = 'data_str3_all0.txt';
      String fileName = 'data_str2.txt';
      String filePath = 'test/dataset/$fileName';
      List<String> dataStrLines = await File(filePath).readAsLines();

      // Call the countStepsMain function for each line and print the result
      int lineNumber = 1;
      for (String dataStr in dataStrLines) {
        int trueSteps = trueStep(dataStr);
        print("True steps = $trueSteps");
        int steps = countStepsMain(dataStr);
        print('$lineNumber Counted steps = $steps');
        lineNumber++;
      }
    });
  });
}
