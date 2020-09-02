import 'package:learningflutterexamples/examples/test/counter.dart';
import 'package:test/test.dart';

void main() {
  group('Counter class', () {
    test('value should start in 0', () {
      expect(Counter().value, 0);
    });

    test('value should increase in 1', () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 1);
    });

    test('example with all', () {
      final counter = Counter();
      expect(counter.value, 0);
      counter.increment();
      expect(counter.value, 1);
    });
  });
}
