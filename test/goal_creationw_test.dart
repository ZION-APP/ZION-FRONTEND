import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zionapp/screens/goal_creation/goal_creation.dart';

void main() {

  testWidgets('TestNombreMeta1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre de la meta');
    await tester.enterText(nametbox, 'MyUserNameThatExcedsTheLimitsdasdadasdwasdwasdawasdawdasdwdadwdasdwdasdw');
    await tester.pump();
    //testFunctionality
    expect(find.text('MyUserNameThatExcedsTheLimitsdasdadasdwasdwasdawasdawdasdwdadwdasdwdasdw'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre válido'), findsOneWidget);
  });

  testWidgets('TestNombreMeta2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre de la meta');
    await tester.enterText(nametbox, 'xd');
    await tester.pump();
    //testFunctionality
    expect(find.text('xd'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre válido'), findsOneWidget);
  });

  testWidgets('TestNombreMeta3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre de la meta');
    await tester.enterText(nametbox, 'Mi Nombre Completo');
    await tester.pump();
    //testFunctionality
    expect(find.text('Mi Nombre Completo'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre válido'), findsNothing);
  });

  testWidgets('TestMontoTotal1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cuánto es el monto total para la meta?');
    await tester.enterText(nametbox, '19AB283');
    await tester.pump();
    //testFunctionality
    expect(find.text('19AB283'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsOneWidget);
  });

  testWidgets('TestMontoTotal2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cuánto es el monto total para la meta?');
    await tester.enterText(nametbox, 'asdaw');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdaw'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsOneWidget);
  });

  testWidgets('TestMontoTotal3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cuánto es el monto total para la meta?');
    await tester.enterText(nametbox, '12323.2343');
    await tester.pump();
    //testFunctionality
    expect(find.text('12323.2343'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsOneWidget);
  });

  testWidgets('TestMontoTotal4', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cuánto es el monto total para la meta?');
    await tester.enterText(nametbox, '12983');
    await tester.pump();
    //testFunctionality
    expect(find.text('12983'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsNothing);
  });

  testWidgets('TestTipoFondo1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.byKey(const Key('TipoFondo'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Omega').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Omega').last, findsOneWidget);
  });

  testWidgets('TestTipoFondo2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.byKey(const Key('TipoFondo'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Alpha').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Alpha').last, findsOneWidget);
  });

  testWidgets('TestInvInicial1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Inversión inicial a revisar');
    await tester.enterText(nametbox, '19AB283');
    await tester.pump();
    //testFunctionality
    expect(find.text('19AB283'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsOneWidget);
  });

  testWidgets('TestInvInicial2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Inversión inicial a revisar');
    await tester.enterText(nametbox, 'asdaw');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdaw'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsOneWidget);
  });

  testWidgets('TestInvInicial3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Inversión inicial a revisar');
    await tester.enterText(nametbox, '12323.2343');
    await tester.pump();
    //testFunctionality
    expect(find.text('12323.2343'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsOneWidget);
  });

  testWidgets('TestInvInicial4', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Inversión inicial a revisar');
    await tester.enterText(nametbox, '12983');
    await tester.pump();
    //testFunctionality
    expect(find.text('12983'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un número como 100000'), findsNothing);
  });

  testWidgets('TestButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: GoalCreation(isUpdateForm: false,),
      ),
    );
    expect(find.text('Registrar'), findsOneWidget);
  });
}