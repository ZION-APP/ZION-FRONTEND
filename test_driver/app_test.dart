import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  FlutterDriver driver;

  group('Acceptance Test', () {

    //login
    final loginNameBox = find.byValueKey('loginUserName');
    final loginPassBox = find.byValueKey('loginPass');
    final loginButton = find.byValueKey('loginButton');


    setUpAll(() async {
        driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if(driver != null){
        driver.close();
      }
    });

    test('appLoginTest1', () async {
      await driver.tap(loginNameBox);
      await driver.enterText('TestXC2');

      await driver.tap(loginPassBox);
      await driver.enterText('Test_123');

      await driver.tap(loginButton);
      await driver.waitFor(find.text('Metas'));
    });
  });
}