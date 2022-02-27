import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ioka/src/widgets/theme/utils.dart';

class IokaIcon extends StatelessWidget {
  const IokaIcon(
    this.icon, {
    Key? key,
    this.size,
    this.color,
  }) : super(key: key);

  final String icon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'lib/assets/icons/$icon.svg',
      package: 'ioka',
      width: size,
      height: size,
      color: color,
    );
  }
}

class AdaptiveIokaIcon extends StatelessWidget {
  const AdaptiveIokaIcon({
    Key? key,
    required this.lightIcon,
    required this.darkIcon,
    this.size,
    this.color,
  }) : super(key: key);

  final String lightIcon;
  final String darkIcon;
  final double? size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final brightness = IokaThemeUtils.getBrightness(context);

    return AnimatedCrossFade(
      crossFadeState: brightness == Brightness.light
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: const Duration(milliseconds: 200),
      firstChild: IokaIcon(lightIcon, size: size, color: color),
      secondChild: IokaIcon(darkIcon, size: size, color: color),
      alignment: Alignment.center,
    );
  }
}
