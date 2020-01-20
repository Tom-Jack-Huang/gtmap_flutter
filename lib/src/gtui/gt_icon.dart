import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';
import '../utils/gt_util.dart';
class GTIcon extends StatefulWidget {
  final String codePoint;
  final String fontFamily;
  final double size;
  final Color color;
  GTIcon(this.codePoint, {this.fontFamily, this.size,this.color}) : super();
  @override
  _GTIconState createState() => _GTIconState();
}

class _GTIconState extends State<GTIcon> {
  //&#xe64a;
  @override
  Widget build(BuildContext context) {
    return Icon(
      IconData(GTUtils.getIconFontFromString(widget.codePoint), fontFamily: widget.fontFamily ?? GTConfigurationTemplate.fontFamily),
      size: widget.size ?? GTConfigurationTemplate.iconSize,
      color: widget.color??GTConfigurationTemplate.mainColor,
    );
  }
}
