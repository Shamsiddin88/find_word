import 'package:find_word/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "Game Screen uchun detailed Test",
        (widgetTester) async {
      await widgetTester.pumpWidget(HomeScreen());
      expect(find.byWidget(Text("4 PICS 1 WORD")), findsOneWidget);
    },
  );
}
