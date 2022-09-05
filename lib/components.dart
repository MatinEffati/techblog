import 'package:flutter/material.dart';
import 'package:tech_blog/colors.dart';

class TechDivider extends StatelessWidget {
  const TechDivider({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: SolidColors.divider,
      indent: size.width / 6,
      endIndent: size.width / 6,
      thickness: 1.3,
    );
  }
}
