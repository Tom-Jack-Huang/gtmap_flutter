import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';

class GTFillButton extends StatefulWidget {
  final ValueChanged<GTFillButton> onPressed;
  final Color fillColor;
  final Widget child;
  final double radius;
  final double height;
  final double width;
  final bool enabled;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  GTFillButton({this.onPressed, this.fillColor, this.child, this.radius, this.height, this.width, this.enabled = true,this.padding,this.margin}) : super();
  @override
  _GTFillButtonState createState() => _GTFillButtonState();
}

class _GTFillButtonState extends State<GTFillButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 40,
      width: widget.width,
      margin: widget.margin,
      padding: widget.padding,
      child: FlatButton(
          splashColor: Colors.transparent,
          highlightColor: Colors.white.withAlpha(GTConfigurationTemplate.buttonHighlightedAlpha),
          onPressed: () {
            if (widget.enabled&& widget.onPressed!=null) {
              widget.onPressed(this.widget);
            }
          },
          color: widget.fillColor ?? GTConfigurationTemplate.fillButtonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(widget.radius ?? (widget.height == null ? 20 : widget.height / 2.0))),
          child: widget.child ?? Container()),
    );
  }
}
