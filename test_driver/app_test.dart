import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    FlutterDriver driver;

    // Connect to the Flutter driver before running any tests.
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Close the connection to the driver after the tests have completed.
    tearDownAll(() async {
      if (driver != null) {
        await driver.close();
      }
    });

    test('starts at 0', () async {
      // Use the `driver.getText` method to verify the counter starts at 0.
      expect(await driver.getText(counterTextFinder), '0');
    });

    test('increments the counter', () async {
      // First, tap the button.
      for (var i = 0; i < 50; i++) {
        await driver.tap(buttonFinder);
      }

      // Then, verify the counter text is incremented by 1.
      expect(await driver.getText(counterTextFinder), '50');
    });
  });
}
