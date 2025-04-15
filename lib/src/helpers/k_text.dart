import 'package:flutter/material.dart';

class KText extends StatelessWidget {
  final String? text;
  final Color? color;
  final double? fontSize;
  final String? fontFamily;
  final int? maxLines;
  final FontWeight? fontWeight;
  final double? letterSpacing;
  final TextAlign? textAlign;

  const KText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontFamily,
    this.maxLines,
    this.fontWeight,
    this.letterSpacing,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '$text',
      textScaleFactor: 1.0,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontWeight: fontWeight ?? FontWeight.normal,
        fontSize: fontSize ?? 14,
        fontFamily: fontFamily ?? 'Roboto',
        color: color ?? Colors.black87,
        letterSpacing: letterSpacing ?? 0.0,
      ),
      maxLines: maxLines,
      // overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
    );
  }
}
