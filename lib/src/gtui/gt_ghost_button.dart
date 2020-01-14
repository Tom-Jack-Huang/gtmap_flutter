import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';

class GTGhostButton extends StatefulWidget {
  final ValueChanged<GTGhostButton> onPressed;
  final Color ghostColor;
  final Widget child;
  final double radius;
  final double height;
  final double width;
  final bool enabled;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  GTGhostButton({this.onPressed, this.ghostColor, this.child, this.radius, this.height, this.width, this.enabled = true,this.margin,this.padding}) : super();
  @override
  _GTGhostButtonState createState() => _GTGhostButtonState();
}

class _GTGhostButtonState extends State<GTGhostButton> {
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
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius ?? (widget.height == null ? 20 : widget.height / 2.0)),
              side: BorderSide(color: widget.ghostColor ?? GTConfigurationTemplate.ghostButtonColor)),
          child: widget.child ?? Container()),
    );
  }
}
