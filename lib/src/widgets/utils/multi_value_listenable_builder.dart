import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class MultiValueListenableBuilder extends StatefulWidget {
  const MultiValueListenableBuilder({
    Key? key,
    required this.listenables,
    required this.builder,
  }) : super(key: key);

  final Iterable<ValueListenable> listenables;
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

    for (final listenable in widget.listenables) {
      listenable.addListener(_onChanged);
    }
  }

  @override
  void didUpdateWidget(covariant MultiValueListenableBuilder oldWidget) {
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
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(context);
  }
}
