# ioka 

Flutter SDK для [ioka](https://ioka.kz).

[Пример приложения](./demo/lib/main.dart)

## Оглавление
- [ioka](#ioka)
  - [Оглавление](#оглавление)
  - [Установка и использование](#установка-и-использование)
  - [Доступный функционал](#доступный-функционал)
  - [Кастомизация](#кастомизация)
    - [Глобально](#глобально)
    - [Локально](#локально)
    - [Простая настройка темы](#простая-настройка-темы)
    - [Автоматическая генерация темы](#автоматическая-генерация-темы)
  - [Локализация](#локализация)
  - [Тестирование](#тестирование)
  - [Документация](#документация)

## Установка и использование

Для того, чтобы пользоваться SDK, вам нужно зарегистрироваться 
[по ссылке](https://ioka.kz/contact-form) и получить публичный ключ для 
приложения.

Затем, можете установить пакет:

```yaml
packages:
  ioka: <latest_version>
```

В энтрипоинте приложения (`main`) вам нужно инициализировать SDK:

```dart
void main() {
  Ioka.setup('<PUBLIC_KEY>');
  runApp(const MyApp());
}
```

Режим SDK (`staging` или `production`) определяется автоматически в зависимости 
от значения публичного ключа.

Чтобы начать платёж, вам нужно создать заказ на сервере и передать 
`orderAccessToken`:

```dart
final orderAccessToken = ...;

Ioka.instance.startCheckoutFlow(
  context: context,
  orderAccessToken: orderAccessToken,
);
```

Подробнее об использовании каждого метода можете узнать в 
[документации](./doc/README.md) либо в [демо-приложении](./demo/lib/main.dart).

## Доступный функционал

- [x] Форма оплаты новой и сохраненной картой
- [x] Возможность сохранять карту у пользователя
- [x] Подтверждение оплаты через 3D Secure
- [x] Кастомизация интерфейсов
- [ ] Полная кастомизация интерфейсов 
- [x] Автоматическая кастомизация
- [ ] Apple Pay / Google Pay
- [x] Локализация
- [ ] Документация (в разработке)
- [ ] Тестирование и мокинг (в разработке)

## Кастомизация

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

Подробнее о кастомизации можно прочитать в [документации](./doc/theme.md).

## Локализация

На данный момент SDK поддерживает русский и английский язык. Если вы используете
локализацию по [гайдам Flutter](https://docs.flutter.dev/development/accessibility-and-localization/internationalization),
то SDK будет автоматически определять язык.

В случае, если вы используете кастомное решение, то локаль можно передать при
вызове методов в `Ioka.instance`:

```dart
Ioka.instance.startCheckoutFlow(
  context: context,
  orderAccessToken: '<ORDER_ACCESS_TOKEN>',
  locale: Locale('ru'),
);
```

По умолчанию и в случае если локаль не найден используется русский язык.

## Тестирование

**В процессе разработки.**

## Документация

Вся документация содержится в папке [doc](./doc), а также в виде inline
комментариев.