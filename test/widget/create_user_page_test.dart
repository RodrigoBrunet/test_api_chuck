import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_api_chuck/pages/create_user_page.dart';

void main() {
  var myMaterialApp = const MaterialApp(home: CreateUserPage());

  testWidgets('Deve encontrar a key [titulo] quando a tela for carregada',
      (widgetTester) async {
    const titulo = Key('titulo');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(titulo), findsOneWidget);
  });
  testWidgets('Deve encontrar a key [IconButton] quando a tela for carregada',
      (widgetTester) async {
    const iconButton = Key('IconButton');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(iconButton), findsOneWidget);
  });
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
  testWidgets('Deve encontrar a key [inputAge] quando a tela for carregada',
      (widgetTester) async {
    const inputAge = Key('inputAge');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(inputAge), findsOneWidget);
  });
  testWidgets('Deve encontrar a key [textButton] quando a tela for carregada',
      (widgetTester) async {
    const textButton = Key('textButton');
    await widgetTester.pumpWidget(myMaterialApp);
    expect(find.byKey(textButton), findsOneWidget);
  });
}
