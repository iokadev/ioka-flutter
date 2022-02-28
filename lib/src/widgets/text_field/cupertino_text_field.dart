import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:ioka/src/widgets/cupertino_widgets.dart';

class IokaCupertinoTextField extends StatefulWidget {
  const IokaCupertinoTextField({
    Key? key,
    required this.hint,
    this.formState,
    this.onChanged,
    this.onEditingComplete,
    this.errorText,
    this.enabled = true,
    this.secure = false,
    this.obscureText = false,
    this.textInputAction,
    this.keyboardType,
    this.inputFormatters,
    this.prefix,
    this.suffix,
    this.autofocus = false,
  }) : super(key: key);

  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final String? errorText;
  final bool enabled;
  final bool secure;
  final bool obscureText;
  final bool autofocus;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldState<String>? formState;
  final Widget? prefix;
  final Widget? suffix;

  @override
  State<IokaCupertinoTextField> createState() => _IokaCupertinoTextFieldState();
}

class _IokaCupertinoTextFieldState extends State<IokaCupertinoTextField> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  var _hasFocus = false;

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(_onFocusChanged);
  }

  void _onFocusChanged() {
    if (_hasFocus && !_focusNode.hasFocus) {
      _onEditingComplete();
    }

    setState(() {
      _hasFocus = _focusNode.hasFocus;
    });
  }

  void _onChanged(String value) {
    if (widget.onChanged != null) {
      widget.onChanged!(value);
    }

    if (widget.formState != null) {
      widget.formState!.didChange(value);

      if (widget.formState!.hasError) {
        widget.formState!.validate();
      }
    }
  }

  void _onEditingComplete() {
    if (widget.onEditingComplete != null) {
      widget.onEditingComplete!();
    }

    if (widget.formState != null) {
      widget.formState!.save();
      widget.formState!.validate();
    }
  }

  @override
  void didUpdateWidget(covariant IokaCupertinoTextField oldWidget) {
    _focusNode.canRequestFocus = widget.enabled;

    if (widget.formState != null &&
        widget.formState!.value != _controller.text) {
      _controller.text = widget.formState!.value ?? '';
    }

    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasFocus = _focusNode.hasFocus;

    final backgroundColor = context.colors.fill4;
    Color borderColor;

    if (widget.errorText != null || widget.formState?.errorText != null) {
      borderColor = context.colors.error;
    } else if (hasFocus) {
      borderColor = context.colors.primary;
    } else {
      borderColor = context.colors.primary.withOpacity(0.0);
    }

    return CupertinoTextField.borderless(
      controller: _controller,
      focusNode: _focusNode,
      placeholder: widget.hint,
      placeholderStyle: context.typography.body.copyWith(
        color: context.colors.grey,
      ),
      inputFormatters: widget.inputFormatters,
      keyboardType: widget.keyboardType,
      autofocus: widget.autofocus,
      autocorrect: !widget.secure,
      enableSuggestions: !widget.secure,
      enableIMEPersonalizedLearning: !widget.secure,
      obscureText: widget.obscureText,
      textInputAction: widget.textInputAction,
      prefix: widget.prefix,
      suffix: widget.suffix,
      onChanged: _onChanged,
      onEditingComplete: _onEditingComplete,
      readOnly: !widget.enabled,
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 18.0,
      ),
      style: TextStyle(
        color: widget.enabled ? context.colors.fill2 : context.colors.grey,
      ),
      decoration: BoxDecoration(
        borderRadius: context.themeExtras.borderRadius,
        color: backgroundColor,
        border: Border.all(
          color: widget.enabled ? borderColor : backgroundColor,
          width: 1.0,
        ),
      ),
    );
  }
}
