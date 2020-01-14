import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';
class GTImageButton extends StatefulWidget {
  final ValueChanged<GTImageButton> onPressed;
  final Color backgroundColor;
  final Widget child;
  final double height;
  final double width;
  final bool enabled;
  final String backgroundImageName;
  final EdgeInsetsGeometry contentOffSize;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  GTImageButton({this.onPressed, this.backgroundColor, this.child, this.width, this.height, this.enabled = true,this.backgroundImageName,this.contentOffSize,this.padding,this.margin}) :
        super();
  @override
  _GTImageButtonState createState() => _GTImageButtonState();
}

class _GTImageButtonState extends State<GTImageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      decoration:widget.backgroundImageName!=null?BoxDecoration(
        image: DecorationImage(image: AssetImage(widget.backgroundImageName),fit: BoxFit.fill),
      ):null,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.white.withAlpha(GTConfigurationTemplate.buttonHighlightedAlpha),
        color: widget.backgroundColor,
        onPressed: () {
          if (widget.enabled && widget.onPressed!=null) {
            widget.onPressed(this.widget);
          }
        },
        child: Container(
          margin: widget.contentOffSize??EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: widget.child ?? Container(),
        ),
      ),
    );
  }
}
