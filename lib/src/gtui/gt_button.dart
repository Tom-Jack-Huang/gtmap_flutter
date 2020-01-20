import 'package:flutter/material.dart';

class GTButton extends StatefulWidget {
  final ValueChanged<GTButton> onPressed;
  final Color backgroundColor;
  final Widget child;
  final double height;
  final double width;
  final bool enabled;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final Color highlightColor;
  GTButton({this.onPressed, this.backgroundColor, this.child, this.width, this.height, this.enabled = true,this.padding,this.margin,this.highlightColor}) : super();
  @override
  _GTButtonState createState() => _GTButtonState();
}

class _GTButtonState extends State<GTButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: widget.margin,
      padding: widget.padding,
      child: FlatButton(
        splashColor: Colors.transparent,
        highlightColor: widget.highlightColor?? Colors.transparent,
        color: widget.backgroundColor,
        onPressed: () {
          if (widget.enabled && widget.onPressed!=null) {
            widget.onPressed(this.widget);
          }
        },
        child: widget.child ?? Container(),
      ),
    );
  }
}
