import 'package:flutter/material.dart';
import '../utils/gt_util.dart';

class GTText extends StatefulWidget {
  final String data;
  final String hexColor;
  final double fontSize;
  final String fontFamily;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextOverflow overflow;
  final TextDecoration decoration;
  final TextDecorationStyle decorationStyle;
  final int maxLines;
  GTText(
      this.data,
      {this.hexColor,
        this.fontSize,
        this.fontFamily,
        this.fontWeight,
        this.textAlign,
        this.overflow,
        this.decoration,
        this.decorationStyle,
        this.maxLines
      }):super();
  @override
  _GTTextState createState() => _GTTextState();
}

class _GTTextState extends State<GTText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.data,
      style: TextStyle(
          color: GTUtils.hexToColor(widget.hexColor??('#313131')),
          fontSize: widget.fontSize??14,
        fontFamily: widget.fontFamily,
        fontWeight:widget.fontWeight??FontWeight.normal,
        decoration:widget.decoration,
        decorationStyle: widget.decorationStyle
      ),
      textAlign: widget.textAlign,
      overflow: widget.overflow,
      maxLines: widget.maxLines??1,
    );
  }
}
