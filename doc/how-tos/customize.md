# Инструкции по кастомизации интерфейса SDK

На данный момент, можно кастомизировать эти параметры:

- Яркость (`Brightness`)
- Цвета (background, foreground, accent)
- Радиус элементов (`BorderRadius`)
- Стили текста

Для кастомизации интерфейса используется класс `IokaTheme`. По умолчанию 
используются заводские темы (`IokaTheme.defaultLight` и 
`IokaTheme.defaultDark`). По желанию, можно кастомизировать интерфейс 
следующими способами:

### Глобально

При вызове `Ioka.setup()` опционально можно передать `theme` и `darkTheme`:

```dart
final customTheme = IokaTheme.defaultLight.copyWith(...);
final customDarkTheme = IokaTheme.defaultDark.copyWith(...);

Ioka.setup(
  '<PUBLIC_KEY>', 
  // Передаём тему глобально
  theme: customTheme,
  darkTheme: customDarkTheme, 
);
```

При вызове методов, в зависимости от значения `Theme.of(context).brightness` или
`CupertinoTheme.brightnessOf(context)` в переданном `context` будет 
автоматически использоваться светлая или тёмная тема.

### Локально

В каждый метод в `Ioka.instance` можно передать тему, которая будет 
использоваться для этого метода. Если её не передавать, то будет использоваться 
тема, заданная глобально.

```dart
final customTheme = IokaTheme.defaultLight.copyWith(...);

Ioka.instance.startCheckoutFlow(
  context: context,
  orderAccessToken: '<ORDER_ACCESS_TOKEN>',
  theme: customTheme, // Передаём тему локально
);
```

Также можно передать яркость:

```dart
Ioka.instance.startCheckoutFlow(
  context: context,
  orderAccessToken: '<ORDER_ACCESS_TOKEN>',
  brightness: Brightness.dark, // Эта страница будет отображаться с тёмной темой
);
```

### Простая настройка темы

В классе `IokaTheme` есть конструктор `IokaTheme.simple()`, которым можно
легко сконфигурировать тему под своё приложение:

```dart
final lightTheme = IokaTheme.simpleLight(primaryColor: Colors.blue);
final darkTheme = IokaTheme.simpleDark(primaryColor: Colors.blue);
```

### Автоматическая генерация темы

**Внимание: функционал все ещё в разработке и считается экспериментальным.**

В SDK есть возможность сгенерировать объект `IokaTheme` из `material.Theme` или
`cupertino.CupertinoTheme`. Для этого можно передать флаг 
`automaticallyGenerateTheme` в конфигурации SDK:

```dart
Ioka.setup(
  '<PUBLIC_KEY>', 
  configuration: IokaConfiguration(
    automaticallyGenerateTheme: true,
  ),
);
```

Аналогично, можно сгенерировать тему используя `IokaCupertinoThemeGenerator` или
`IokaMaterialThemeGenerator`:

```dart
// Генерация из material.Theme
final materialTheme = ThemeData(...);
final generatedIokaTheme = IokaMaterialThemeGenerator().toIokaTheme(materialTheme);

// Генерация из cupertino.CupertinoTheme
final cupertinoTheme = CupertinoThemeData(...);
final generatedIokaTheme = IokaCupertinoThemeGenerator().toIokaTheme(cupertinoTheme);
```

