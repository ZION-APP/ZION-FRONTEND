import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:zionapp/screens/register/register.dart';

void main() {
  testWidgets('TestNombreUsuario1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre de usuario');
    await tester.enterText(
        nametbox, 'MyUserNameThatExcedsTheLimitsdasdadasdwasdwasdaw');
    await tester.pump();
    //testFunctionality
    expect(find.text('MyUserNameThatExcedsTheLimitsdasdadasdwasdwasdaw'),
        findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre de usuario válido'),
        findsOneWidget);
  });

  testWidgets('TestNombreUsuario2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre de usuario');
    await tester.enterText(nametbox, 'xd');
    await tester.pump();
    //testFunctionality
    expect(find.text('xd'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre de usuario válido'),
        findsOneWidget);
  });

  testWidgets('TestNombreUsuario3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Nombre de usuario');
    await tester.enterText(nametbox, 'MyUserName');
    await tester.pump();
    //testFunctionality
    expect(find.text('MyUserName'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un nombre de usuario válido'),
        findsNothing);
  });

  testWidgets('TestCedulaRuc1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cédula/RUC');
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
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cédula/RUC');
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
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cédula/RUC');
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
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cédula/RUC');
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
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cédula/RUC');
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
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Cédula/RUC');
    await tester.enterText(nametbox, 'asdwaf123');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdwaf123'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese cédula/RUC válida/o'), findsOneWidget);
  });

  testWidgets('TestTipoPersona1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoPersona'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Persona Natural').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Persona Natural').last, findsOneWidget);
  });

  testWidgets('TestTipoPersona2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.byKey(const Key('TipoPersona'));
    await tester.tap(nametbox);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    await tester.tap(find.text('Persona Jurídica').last);
    await tester.pump();
    await tester.pump(const Duration(seconds: 1));
    //testFunctionality
    expect(find.text('Persona Jurídica').last, findsOneWidget);
  });

  testWidgets('TestCorreo1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Correo electrónico');
    await tester.enterText(nametbox, 'asdwaf123');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdwaf123'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un correo válido'), findsOneWidget);
  });

  testWidgets('TestCorreo2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Correo electrónico');
    await tester.enterText(nametbox, 'asdwaf123@');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdwaf123@'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un correo válido'), findsOneWidget);
  });

  testWidgets('TestCorreo3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Correo electrónico');
    await tester.enterText(nametbox, 'asdwaf123@sas.com');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdwaf123@sas.com'), findsOneWidget);
    //test
    expect(find.text('Por favor ingrese un correo válido'), findsNothing);
  });

  testWidgets('TestContrasena1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Contraseña');
    await tester.enterText(nametbox, 'asd');
    await tester.pump();
    //testFunctionality
    expect(find.text('asd'), findsOneWidget);
    //test
    expect(find.text('La contraseña debe tener mínimo 8 caracteres'),
        findsOneWidget);
  });

  testWidgets('TestContrasena2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Contraseña');
    await tester.enterText(nametbox, 'asdeurien');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdeurien'), findsOneWidget);
    //test
    expect(find.text('La contraseña debe incluir por lo menos 1 Mayúscula'),
        findsOneWidget);
  });

  testWidgets('TestContrasena3', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Contraseña');
    await tester.enterText(nametbox, 'asdeurienD');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdeurienD'), findsOneWidget);
    //test
    expect(find.text('La contraseña debe incluir por lo menos 1 número'),
        findsOneWidget);
  });

  testWidgets('TestContrasena4', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Contraseña');
    await tester.enterText(nametbox, 'asdeurienD3');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdeurienD3'), findsOneWidget);
    //test
    expect(find.text('La contraseña debe incluir por lo menos 1 número'),
        findsNothing);
  });

  testWidgets('TestConfirmarContrasena1', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Contraseña');
    final nametbox2 =
        find.widgetWithText(TextFormField, 'Confirmar contraseña');
    await tester.enterText(nametbox, 'asdeurienD3');
    await tester.pump();
    await tester.enterText(nametbox2, 'asdeurienD');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdeurienD'), findsOneWidget);
    //test
    expect(find.text('Ingrese la misma contraseña'), findsOneWidget);
  });

  testWidgets('TestConfirmarContrasena2', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    final nametbox = find.widgetWithText(TextFormField, 'Contraseña');
    final nametbox2 =
        find.widgetWithText(TextFormField, 'Confirmar contraseña');
    await tester.enterText(nametbox, 'asdeurienD3');
    await tester.pump();
    await tester.enterText(nametbox2, 'asdeurienD3');
    await tester.pump();
    //testFunctionality
    expect(find.text('asdeurienD3'), findsWidgets);
    //test
    expect(find.text('Ingrese la misma contraseña'), findsNothing);
  });

  testWidgets('TestButton', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Register(),
      ),
    );
    expect(find.text('Registrar cuenta'), findsOneWidget);
  });
}
