import 'package:e_letter/Screen/content/content_viewModel.dart';
import 'package:e_letter/Screen/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  var _contentProvider = MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => ContentViewModel())],
    child: const MaterialApp(home: HomeScreen()),
  );
  group('test', () {
    testWidgets('content list', (WidgetTester tester) async {
      await tester.pumpWidget(_contentProvider);
      await tester.pump(const Duration(seconds: 2));
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}
