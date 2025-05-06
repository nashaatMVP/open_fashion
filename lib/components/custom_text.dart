import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color = Colors.white,
    this.max = 1,
    this.height = 1.0,
    this.spacing = 1,
  });

  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  final int max;
  final double height;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: max,
      style: TextStyle(
        letterSpacing: spacing,
        fontSize: size,
        color: color,
        fontWeight: weight,
        height: height,
        overflow: TextOverflow.ellipsis,
        fontFamily: "TenorSans",
      ),
    );
  }
}
