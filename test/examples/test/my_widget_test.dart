import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learningflutterexamples/examples/test/my_widget.dart';

void main() {
  testWidgets('My widget test', (WidgetTester tester) async {
    await tester.pumpWidget(MyWidget());

    expect(find.text('Test'), findsOneWidget);
    expect(find.text('0'), findsOneWidget);
    expect(find.text('Add'), findsOneWidget);
    expect(find.text('Test Provider'), findsOneWidget);

    for (var i = 0; i < 10; i++) {
      await tester.tap(find.byType(RaisedButton));
    }

    await tester.pump();

    expect(find.text('10'), findsOneWidget);
  });
}
