import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

/// Показывает подсказку для поля ввода CVC.
/// 
/// Локация подсказки зависит от переданного [context].
/// 
/// Подробнее о подсказках можно прочитать в [showTooltip].
Future<void> showCvcTooltip(BuildContext context) {
  return showTooltip(
    context,
    builder: (_) => CvcTooltipWidget(hint: context.l10n.cvcTooltipHint),
  );
}

/// Виджет подсказки для поля ввода CVC.
/// 
/// Используется через метод [showCvcTooltip].
/// 
/// Подробнее о подсказках можно прочитать в [showTooltip].
class CvcTooltipWidget extends StatelessWidget {
  /// Создает виджет подсказки для поля ввода CVC.
  /// 
  /// - [hint]: Текст подсказки.
  const CvcTooltipWidget({
    Key? key,
    required this.hint,
  }) : super(key: key);

  /// Текст подсказки.
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          const IokaIcon(IokaIcons.cvc),
          const SizedBox(width: 12.0),
          Text(hint),
        ],
      ),
    );
  }
}
