import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zionapp/screens/cuenta_bancaria/cuenta_bancaria.dart';

void main() {

  testWidgets('TestNombreTitular1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre completo del titular');
    await tester.enterText(nametbox, 'MyUserNameThatExcedsTheLimitsdasdadasdwasdwasdawasdawdasdwdadwdasdwdasdw');
    await tester.pump();
    //testFunctionality
    expect(find.text('MyUserNameThatExcedsTheLimitsdasdadasdwasdwasdawasdawdasdwdadwdasdwdasdw'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre válido'), findsOneWidget);
  });

  testWidgets('TestNombreTitular2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre completo del titular');
    await tester.enterText(nametbox, 'xd');
    await tester.pump();
    //testFunctionality
    expect(find.text('xd'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre válido'), findsOneWidget);
  });

  testWidgets('TestNombreUsuario3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre completo del titular');
    await tester.enterText(nametbox, 'Mi Nombre Completo');
    await tester.pump();
    //testFunctionality
    expect(find.text('Mi Nombre Completo'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre válido'), findsNothing);
  });

  testWidgets('TestCedulaRuc1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Número de cédula/RUC');
    await tester.enterText(nametbox, '0923');
    await tester.pump();
    //testFunctionality
    expect(find.text('0923'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsOneWidget);
  });

  testWidgets('TestCedulaRuc2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Número de cédula/RUC');
    await tester.enterText(nametbox, '0923247384');
    await tester.pump();
    //testFunctionality
    expect(find.text('0923247384'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsNothing);
  });

  testWidgets('TestCedulaRuc3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Número de cédula/RUC');
    await tester.enterText(nametbox, '09232473843');
    await tester.pump();
    //testFunctionality
    expect(find.text('09232473843'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsOneWidget);
  });

  testWidgets('TestCedulaRuc4', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Número de cédula/RUC');
    await tester.enterText(nametbox, '0923247384122');
    await tester.pump();
    //testFunctionality
    expect(find.text('0923247384122'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsNothing);
  });

  testWidgets('TestCedulaRuc5', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Número de cédula/RUC');
    await tester.enterText(nametbox, '09232473843231231231231');
    await tester.pump();
    //testFunctionality
    expect(find.text('09232473843231231231231'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsOneWidget);
  });

  testWidgets('TestCedulaRuc6', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Número de cédula/RUC');
    await tester.enterText(nametbox, 'asdwaf123');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdwaf123'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsOneWidget);
  });

  testWidgets('TestTipoBanco1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Banco Pacífico').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Banco Pacífico').last, findsOneWidget);
  });

  testWidgets('TestTipoBanco2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Banco Guayaquil').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Banco Guayaquil').last, findsOneWidget);
  });

  testWidgets('TestTipoBanco3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Produbanco').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Produbanco').last, findsOneWidget);
  });

  testWidgets('TestNumCuenta1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Banco Pacífico').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final numtbox = find.widgetWithText(TextFormField, 'Número de la cuenta');
    await tester.enterText(numtbox, '0938425902');
    await tester.pump();
    //testFunctionality
    expect(find.text('0938425902'), findsOneWidget);
    //test
    expect(find.text('Por favor ingresar un número válido'), findsNothing);
  });

  testWidgets('TestNumCuenta2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Banco Pacífico').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final numtbox = find.widgetWithText(TextFormField, 'Número de la cuenta');
    await tester.enterText(numtbox, '09384259023');
    await tester.pump();
    //testFunctionality
    expect(find.text('09384259023'), findsOneWidget);
    //test
    expect(find.text('Por favor ingresar un número válido'), findsOneWidget);
  });

  testWidgets('TestNumCuenta3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Banco Guayaquil').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final numtbox = find.widgetWithText(TextFormField, 'Número de la cuenta');
    await tester.enterText(numtbox, '0938425902');
    await tester.pump();
    //testFunctionality
    expect(find.text('0938425902'), findsOneWidget);
    //test
    expect(find.text('Por favor ingresar un número válido'), findsNothing);
  });

  testWidgets('TestNumCuenta4', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Banco Guayaquil').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final numtbox = find.widgetWithText(TextFormField, 'Número de la cuenta');
    await tester.enterText(numtbox, '09384259023');
    await tester.pump();
    //testFunctionality
    expect(find.text('09384259023'), findsOneWidget);
    //test
    expect(find.text('Por favor ingresar un número válido'), findsOneWidget);
  });

  testWidgets('TestNumCuenta5', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Produbanco').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final numtbox = find.widgetWithText(TextFormField, 'Número de la cuenta');
    await tester.enterText(numtbox, '0938425902');
    await tester.pump();
    //testFunctionality
    expect(find.text('0938425902'), findsOneWidget);
    //test
    expect(find.text('Por favor ingresar un número válido'), findsOneWidget);
  });

  testWidgets('TestNumCuenta6', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoBanco'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Produbanco').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    final numtbox = find.widgetWithText(TextFormField, 'Número de la cuenta');
    await tester.enterText(numtbox, '09384259023');
    await tester.pump();
    //testFunctionality
    expect(find.text('09384259023'), findsOneWidget);
    //test
    expect(find.text('Por favor ingresar un número válido'), findsNothing);
  });

  testWidgets('TestTipoCuenta1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoCuenta'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Cuenta de ahorros').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Cuenta de ahorros').last, findsOneWidget);
  });

  testWidgets('TestTipoCuenta2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoCuenta'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Cuenta corriente').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Cuenta corriente').last, findsOneWidget);
  });

  testWidgets('TestButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: CuentaBancaria(),
      ),
    );
    expect(find.text('Registrar cuenta'), findsOneWidget);
  });
}