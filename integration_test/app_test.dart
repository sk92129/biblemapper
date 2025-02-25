import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:universalapp/main.dart' as app;
import 'package:flutter/material.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('UI Navigation Test', () {
    testWidgets('Test main app navigation and interactions', (tester) async {
      // Initialize the app
      app.main();
      await tester.pumpAndSettle();

      // Helper function to verify a widget is both present and accessible
      Future<void> verifyAccessibleWidget(Finder finder) async {
        expect(finder, findsOneWidget);
        final widget = tester.widget(finder);
        if (widget is Semantics) {
          expect(widget.properties.label, isNotNull);
        }
      }

      // Test navigation and interactions
      // Add your specific navigation tests here based on your app's structure
    });

    testWidgets('Test Bible Reading Navigation', (tester) async {
      // Initialize the app
      app.main();
      await tester.pumpAndSettle();

      // Find and tap a specific button (replace with your actual widget keys)
      final bibleButton = find.byKey(const Key('bible_reading_button'));
      await verifyAccessibleWidget(bibleButton);
      await tester.tap(bibleButton);
      await tester.pumpAndSettle();

      // Verify the new screen is shown
      expect(find.text('Bible Reading'), findsOneWidget);
    });
  });
} 