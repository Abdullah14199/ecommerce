import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextUtlis extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  final TextDecoration textDecoration;

  const TextUtlis({
    required this.text ,
    required this.fontWeight,
    required this.color ,
    required this.fontSize,
    required this.textDecoration
    ,Key? key}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.lato(
          decoration: textDecoration,
          textStyle: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      )
    );
  }
}
