import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:test_api_chuck/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('Login Page E2E Test |', () {
    testWidgets('Deve clicar no botao com o texto [login]',
        (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();
      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('Deve preencher os campos e clicar no botao login',
        (widgetTester) async {
      await widgetTester.pumpWidget(const MyApp());
      await widgetTester.pumpAndSettle();
      await widgetTester.enterText(
          find.byKey(const Key('inputEmail')), 'rodrigo@rodrigo.com');
      await widgetTester.pumpAndSettle();
      await widgetTester.enterText(
          find.byKey(const Key('inputPassword')), '12345');
      await widgetTester.pumpAndSettle();
      await widgetTester.tap(find.byType(ElevatedButton));
      await widgetTester.pumpAndSettle();
    });
  });
}
