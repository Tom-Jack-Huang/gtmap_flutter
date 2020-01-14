import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';
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
      IconData(int.parse(widget.codePoint.replaceAll('&#', '0').replaceAll(';', '')), fontFamily: widget.fontFamily ?? 'IconFont'),
      size: widget.size ?? 16,
      color: widget.color??GTConfigurationTemplate.mainColor,
    );
  }
}
