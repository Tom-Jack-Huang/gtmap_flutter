import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';
class GTSlider extends StatefulWidget {
  final double value;
  final double width;
  final Color inactiveColor;
  final Color activeColor;
  GTSlider({this.value = 0.0,this.width,this.inactiveColor,this.activeColor}):super();
  @override
  _GTSliderState createState() => _GTSliderState();
}

class _GTSliderState extends State<GTSlider> {
  double _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      child: Slider(
          value: _value,
          inactiveColor: widget.inactiveColor??Colors.black12,
          activeColor: widget.activeColor??GTConfigurationTemplate.mainColor,
          onChanged: (value){
            setState(() {
              _value = value;
            });
          }
      ),
    );
  }
}
