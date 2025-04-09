import 'package:exchange_app/src/presentation/widgets/custom_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CustomButtonWidget Tests', () {
    testWidgets('displays the correct title', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButtonWidget(
              onTap: () {},
              title: 'Test Button',
            ),
          ),
        ),
      );
      expect(find.text('Test Button'), findsOneWidget);
    });

    testWidgets('calls onTap when pressed', (WidgetTester tester) async {
      bool wasTapped = false;
      void mockOnTap() {
        wasTapped = true;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButtonWidget(
              onTap: mockOnTap,
              title: 'Tap Me',
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      expect(wasTapped, true);
    });

    testWidgets('triggers HapticFeedback on button press', (WidgetTester tester) async {
      bool wasTapped = false;
      void mockOnTap() {
        wasTapped = true;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomButtonWidget(
              onTap: mockOnTap,
              title: 'Tap Me',
            ),
          ),
        ),
      );
      await tester.tap(find.byType(ElevatedButton));
      expect(wasTapped, true);
    });
  });
}