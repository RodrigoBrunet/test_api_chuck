import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_api_chuck/pages/login_page.dart';

void main() {
  var myMaterialApp = const MaterialApp(home: LoginPage());
  testWidgets('Deve encontrar a key [inputEmail] quando a tela for carregada',
      (widgetTester) async {
    const inputEmail = Key('inputEmail');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(inputEmail), findsOneWidget);
  });
  testWidgets(
      'Deve encontrar a key [inputPassword] quando a tela for carregada',
      (widgetTester) async {
    const inputPassword = Key('inputPassword');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(inputPassword), findsOneWidget);
  });
  testWidgets(
      'Deve encontrar a key [elevatedButton] quando a tela for carregada',
      (widgetTester) async {
    const elevatedButton = Key('elevatedButton');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(elevatedButton), findsOneWidget);
  });
  testWidgets('Deve clicar no botao quando a função for chamada',
      (widgetTester) async {
    await widgetTester.pumpWidget(myMaterialApp);
    await widgetTester.tap(find.byType(ElevatedButton));
    expect(find.text('Login'), findsOneWidget);
  });
}
