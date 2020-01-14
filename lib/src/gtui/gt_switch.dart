import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';

class GTSwitch extends StatefulWidget {
  final bool value;
  final Color activeColor;
  final Color activeTrackColor;
  final Color inactiveThumbColor;
  final Color inactiveTrackColor;
  final String activeThumbImageName;
  final String inactiveThumbImageName;
  final double width;
  final ValueChanged<bool> onChanged;
  GTSwitch(
      {this.value = false,
      this.activeColor,
      this.activeTrackColor,
      this.inactiveThumbColor,
      this.inactiveTrackColor,
      this.width,
      this.activeThumbImageName,
      this.inactiveThumbImageName,
      this.onChanged})
      : super();
  @override
  _GTSwitchState createState() => _GTSwitchState();
}

class _GTSwitchState extends State<GTSwitch> {
  bool _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 60,
      child: Switch(
          value: _value,
          activeColor: widget.activeColor ?? GTConfigurationTemplate.mainColor,
          activeTrackColor: widget.activeTrackColor ?? GTConfigurationTemplate.mainColor,
          inactiveThumbColor: widget.inactiveThumbColor ?? Colors.white,
          inactiveTrackColor: widget.inactiveTrackColor ?? Colors.black12,
          activeThumbImage: widget.activeThumbImageName != null ? AssetImage(widget.activeThumbImageName) : null,
          inactiveThumbImage: widget.inactiveThumbImageName != null ? AssetImage(widget.inactiveThumbImageName) : null,
          onChanged: (value) {
            setState(() {
              _value = value;
            });
            if (widget.onChanged != null) {
              widget.onChanged(value);
            }
          }),
    );
  }
}
