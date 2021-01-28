import 'package:flutter/material.dart';

class GTImage extends StatefulWidget {
  final String imageName;
  final double width;
  final double height;
  final Color color;
  final BlendMode colorBlendMode;
  final BoxFit fit;
  GTImage(this.imageName,
      {this.width, this.height, this.fit, this.color, this.colorBlendMode})
      : super();
  @override
  _GTImageState createState() => _GTImageState();
}

class _GTImageState extends State<GTImage> {
  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage(widget.imageName),
      width: widget.width,
      height: widget.height,
      fit: widget.fit ?? BoxFit.fill,
      color: widget.color ?? null,
      colorBlendMode: widget.colorBlendMode ?? BlendMode.color,
    );
  }
}
