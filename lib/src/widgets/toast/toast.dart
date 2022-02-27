import 'package:flutter/material.dart';
import 'package:ioka/ioka.dart';

class IokaToast extends StatelessWidget {
  const IokaToast({
    Key? key,
    required this.message,
    required this.color,
    required this.onClose,
    required this.borderRadius,
    required this.textStyle,
    this.foregroundColor = Colors.white,
  }) : super(key: key);

  final String message;
  final Color color;
  final Color foregroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final VoidCallback onClose;

  static Future<void> show(
    BuildContext outerContext, {
    required String message,
    required Color color,
    required Color foregroundColor,
    EdgeInsets padding = const EdgeInsets.all(16.0),
  }) async {
    late OverlayEntry overlay;

    final borderRadius = outerContext.themeExtras.borderRadius;
    final textStyle = outerContext.typography.subtitle;

    overlay = OverlayEntry(
      maintainState: true,
      builder: (context) => _ToastOverlayEntry(
        onDispose: overlay.remove,
        message: message,
        color: color,
        foregroundColor: foregroundColor,
        borderRadius: borderRadius,
        textStyle: textStyle,
        padding: padding,
      ),
    );

    Overlay.of(outerContext)!.insert(overlay);
  }

  static Future<void> showSuccess(
    BuildContext context, {
    required String message,
    EdgeInsets padding = const EdgeInsets.all(16.0),
  }) {
    return show(
      context,
      message: message,
      color: context.colors.success,
      foregroundColor: Colors.white,
      padding: padding,
    );
  }

  static Future<void> showError(
    BuildContext context, {
    required String message,
    EdgeInsets padding = const EdgeInsets.all(16.0),
  }) {
    return show(
      context,
      message: message,
      color: context.colors.error,
      foregroundColor: Colors.white,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            bottom: 8.0,
            top: 8.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: DefaultTextStyle(
                  style: textStyle.copyWith(
                    color: foregroundColor,
                  ),
                  child: Text(message),
                ),
              ),
              IconButton(
                onPressed: onClose,
                icon: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: foregroundColor.withOpacity(0.3),
                  ),
                  child: IokaIcon(
                    IokaIcons.close,
                    color: foregroundColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ToastOverlayEntry extends StatefulWidget {
  const _ToastOverlayEntry({
    Key? key,
    required this.onDispose,
    required this.message,
    required this.color,
    required this.foregroundColor,
    required this.borderRadius,
    required this.textStyle,
    required this.padding,
  }) : super(key: key);

  final String message;
  final Color color;
  final Color foregroundColor;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final EdgeInsets padding;
  final VoidCallback onDispose;

  @override
  State<_ToastOverlayEntry> createState() => __ToastOverlayEntryState();
}

class __ToastOverlayEntryState extends State<_ToastOverlayEntry> {
  var isVisible = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance?.addPostFrameCallback((_) {
      setState(() => isVisible = true);
    });

    Future.delayed(
      const Duration(seconds: 3),
      onDispose,
    );
  }

  var isDisposed = false;
  void onDispose() {
    if (isDisposed) return;

    isDisposed = true;
    setState(() => isVisible = false);

    Future.delayed(
      const Duration(milliseconds: 150),
      onDispose,
    );
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding +
        MediaQuery.of(context).viewInsets +
        widget.padding;

    return Positioned(
      left: padding.left,
      right: padding.right,
      bottom: padding.bottom,
      child: SlideInAnimationWidget(
        offset: const Offset(0.0, 0.1),
        isVisible: isVisible,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: IokaToast(
            message: widget.message,
            color: widget.color,
            foregroundColor: widget.foregroundColor,
            borderRadius: widget.borderRadius,
            textStyle: widget.textStyle,
            onClose: onDispose,
          ),
        ),
      ),
    );
  }
}
