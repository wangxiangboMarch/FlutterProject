import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:to_you_friend/pages/common/web_view_page.dart';

// @todo
void main() {
  testWidgets('test to_you_friend/pages/common/web_view_page.dart', (WidgetTester tester) async {
     final Widget testWidgets = CommonWebViewPage();
      await tester.pumpWidget(
          new MaterialApp(
              home: testWidgets
          )
      );

      expect(find.byWidget(testWidgets), findsOneWidget);
  });
}