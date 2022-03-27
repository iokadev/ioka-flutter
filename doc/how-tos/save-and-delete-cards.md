# Инструкция для взаимодействии с сохраненными картами

SDK предоставляет возможность добавлять и удалять сохраненные карты 
пользователя.

## Оглавление

- [Получение списка сохраненных карт](#получение-списка-сохраненных-карт)
- [Сохранение новой карты](#сохранение-новой-карты)
- [Удаление сохраненной карты](#удаление-сохраненной-карты)

## Получение списка сохраненных карт

Чтобы получить список сохраненных карт, необходимо вызвать метод `getSavedCard()` 
с SDK, передав туда `customer_access_token`:

```dart
// Получаем токен заранее до этого или с сервера
final customerAccessToken = ...;

// Получаем список сохраненных карт
final savedCards = await Ioka.instance.getSavedCards(
  customerAccessToken: customerAccessToken,
);
```

## Сохранение новой карты

Для сохранения новой карты в SDK есть функция `startSaveNewCardFlow()`. Как и с
другими методами, необходим `customer_access_token`.

Помимо токена, необходимо передать `context`.

```dart
// Получаем токен заранее до этого или с сервера
final customerAccessToken = ...;

// Показываем форму сохранения карты
await Ioka.instance.startSaveNewCardFlow(
  context: context,
  customerAccessToken: customerAccessToken,
);
```

Функция возвращает либо объект типа `SavedCard`, либо `null`:

```dart
// Получаем токен заранее до этого или с сервера
final customerAccessToken = ...;

// Показываем форму сохранения карты и сохраняем результат
final result = await Ioka.instance.startSaveNewCardFlow(
  context: context,
  customerAccessToken: customerAccessToken,
);

if (result != null) {
  // Успешно сохранили карту, обновляем интерфейс
  setState(() {});
}
```

## Удаление сохраненной карты

Чтобы удалить сохраненную карту, используйте функцию `deleteSavedCard()`.
Необходимо передать `customer_access_token` и `id` карты, которую нужно удалить:

```dart
// Карта, которую мы хотим удалить
final savedCard = ...;

// Получаем токен с сервера
final customerAccessToken = await MyBackend.getCustomerAccessToken();

// Удаляем эту карту
await Ioka.instance.deleteSavedCard(
  customerAccessToken: customerAccessToken,
  cardId: savedCard.id,
);
```
