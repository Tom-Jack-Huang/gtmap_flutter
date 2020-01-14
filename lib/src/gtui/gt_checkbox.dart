import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';
class GTCheckbox extends StatefulWidget {
  final bool value;
  final Color checkColor;
  final Color activeColor;
  final ValueChanged<bool> onChanged;
  GTCheckbox({this.value = false,this.checkColor,this.activeColor,this.onChanged}):super();
  @override
  _GTCheckboxState createState() => _GTCheckboxState();
}

class _GTCheckboxState extends State<GTCheckbox> {
  bool _value;
  @override
  void initState() {
    super.initState();
    _value = widget.value;
  }
  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: _value,
        activeColor: widget.activeColor??GTConfigurationTemplate.mainColor,
        checkColor: widget.checkColor??Colors.white,
        onChanged: (value){
          setState(() {
            _value = value;
          });
          if(widget.onChanged!=null){
            widget.onChanged(value);
          }
        }
    );
  }
}
