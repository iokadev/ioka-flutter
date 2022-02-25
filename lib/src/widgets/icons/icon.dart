import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

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
