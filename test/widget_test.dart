// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:maxkgapp/main.dart';
import 'package:time_machine/time_machine.dart';

void main() {
  print(DateTime.fromMillisecondsSinceEpoch(1619719200 * 1000).toString());
  print(DateTime.now().toString());

  LocalDateTime a = LocalDateTime.now();
  LocalDateTime b = LocalDateTime.dateTime(DateTime.fromMillisecondsSinceEpoch(1619719200 * 1000));
  Period p = a.periodUntil(b);

  print('${p.days} ${p.hours} ${p.minutes} ${p.seconds}');
  /*testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });*/
}
