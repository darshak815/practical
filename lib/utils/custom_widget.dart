import 'package:flutter/material.dart';

class CustomTestStyle extends TextStyle {
  final Color color;
  final String fontFamily;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle? fontStyle;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final Locale? locale;
  final TextOverflow? overflow;

  const CustomTestStyle({
    this.color = Colors.black,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontStyle,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.locale,
    this.fontFamily = "Arima",
    List<String>? fontFamilyFallback,
    String? package,
    this.overflow,
  });
}

class CustomText extends Text {
  final TextStyle? styleText;
  final TextAlign? textAlign;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? softWrap;
  final TextOverflow? overflow;
  final double? textScaleFactor;
  final int? maxLines;
  final String? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final String data;

  const CustomText(
    this.data, {
    Key? key,
    this.styleText,
    this.textAlign,
    this.textDirection,
    this.locale,
    this.softWrap,
    this.overflow,
    this.textScaleFactor,
    this.maxLines,
    this.semanticsLabel,
    this.textWidthBasis,
  })  : assert(
          data != null,
          'A non-null String must be provided to a Text widget.',
        ),
        super(
          key: key,
          data ?? "",
          style: styleText,
          textAlign: textAlign,
        );
}
