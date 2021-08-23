# App de Zion Administradora de Fondos

App para manejo de fondos Alpha y Omega

## Para ejecutar

```bash
flutter channel stable
flutter upgrade
flutter pub get
flutter run
```

## Generacion de rutas y Objetos serializables

Con el comando flutter pub run build_runner watch --delete-conflicting-outputs

## Probar apis en localhost

En emuladores Android usar la ip 10.0.0.2

## Correr test de aceptación
Utilizar un emulador y ejecutar el comando flutter drive --target=test_driver/app.dart
