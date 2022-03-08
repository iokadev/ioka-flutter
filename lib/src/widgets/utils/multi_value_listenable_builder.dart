import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Позволяет слушать несколько [ValueListenable], и перестраивать виджет
/// при каждом изменении.
class MultiValueListenableBuilder extends StatefulWidget {
  /// Создает новый экземпляр класса [MultiValueListenableBuilder].
  ///
  /// - [listenables] - список [ValueListenable], например [List<ValueNotifier>]
  /// - [builder] - конструктор виджета, который будет перестроен при изменении
  ///   значения.
  const MultiValueListenableBuilder({
    Key? key,
    required this.listenables,
    required this.builder,
  }) : super(key: key);

  /// Список [ValueListenable], например [List<ValueNotifier>].
  final Iterable<ValueListenable> listenables;

  /// Конструктор виджета. Разница с [ValueListenableBuilder] в том, что
  /// значение [ValueListenable] не будет передаваться в эту функцию.
  final WidgetBuilder builder;

  @override
  State<MultiValueListenableBuilder> createState() =>
      _MultiValueListenableBuilderState();
}

class _MultiValueListenableBuilderState
    extends State<MultiValueListenableBuilder> {
  @override
  void initState() {
    super.initState();

    // Регистрируем слушателей
    for (final listenable in widget.listenables) {
      listenable.addListener(_onChanged);
    }
  }

  @override
  void didUpdateWidget(covariant MultiValueListenableBuilder oldWidget) {
    // В случае, если поменялся виджет, то перерегистрируем слушателей.
    for (final listenable in oldWidget.listenables) {
      listenable.removeListener(_onChanged);
    }

    for (final listenable in widget.listenables) {
      listenable.addListener(_onChanged);
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    for (final listenable in widget.listenables) {
      listenable.removeListener(_onChanged);
    }

    super.dispose();
  }

  void _onChanged() {
    if (!mounted) return;

    // При изменении значения одного из [ValueListenable] перестраиваем
    // виджет.
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
