import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app_imc/blocs/imc.bloc.dart';
import 'package:app_imc/pages/home_page.dart';

void main() {
  group('HomePage', () {
    late MaterialApp app;
    late ImcBloc imcBloc;

    setUp(() {
      imcBloc = ImcBloc();
      app = const MaterialApp(home: HomePage());
    });

    testWidgets('Verificando a UI da home page', (WidgetTester tester) async {
      await tester.pumpWidget(app);
      expect(find.text('Calculadora de IMC'), findsOneWidget);
      expect(find.text('Altura (cm)'), findsOneWidget);
      expect(find.text('Peso (kg)'), findsOneWidget);
      expect(find.text('Calcular'), findsOneWidget);
    });

    testWidgets('Verificando o calculo do IMC de uma pessoa Saudável',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);

      await tester.enterText(
          find.widgetWithText(TextFormField, 'Altura (cm)'), '170');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Peso (kg)'), '70');
      await tester.tap(find.text('Calcular'));
      await tester.pump();

      expect(find.text('Saudável (Peso ideal) (24)'), findsOneWidget);
    });

    testWidgets('Verificando o calculo do IMC de uma pessoa com Sobrepeso',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);

      await tester.enterText(
          find.widgetWithText(TextFormField, 'Altura (cm)'), '170');
      await tester.enterText(
          find.widgetWithText(TextFormField, 'Peso (kg)'), '80');
      await tester.tap(find.text('Calcular'));
      await tester.pump();

      expect(find.text('Sobrepeso! (28)'), findsOneWidget);
    });

    testWidgets('Verificando mensagem com campos vazios',
        (WidgetTester tester) async {
      await tester.pumpWidget(app);

      await tester.tap(find.text('Calcular'));
      await tester.pump();

      expect(find.text('Preencha os dados para calcular seu IMC!'),
          findsOneWidget);
    });

    tearDown(() {
      imcBloc.heightCtrl.dispose();
      imcBloc.weightCtrl.dispose();
    });
  });
}
