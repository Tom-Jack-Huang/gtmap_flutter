import 'package:flutter/material.dart';
import 'gt_icon.dart';
import 'gt_button.dart';
import '../utils/gt_util.dart';
import '../gt_configuration_template.dart';

class GTTextField extends StatefulWidget {
  final String text;
  final double width;
  final double height;
  final String iconName;
  final Color iconColor;
  final double iconSize;
  final String placeholder;
  final Color placeholderColor;
  final Color textColor;
  final double fontSize;
  final bool showClearButton;
  final EdgeInsetsGeometry contentPadding; //调整文本方位
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onSubmitted;
  final int maxLength;
  final int maxLines;
  final Color cursorColor;
  final Color borderColor;
  final double borderWidth;
  final double borderRadius;
  final bool obscureText;
  final TextInputAction textInputAction;
final TextInputType keyboardType;
  GTTextField(
      {this.text,
      this.width,
      this.height,
      this.iconName,
      this.iconColor,
      this.iconSize,
      this.placeholder,
      this.placeholderColor,
      this.textColor,
      this.fontSize,
      this.contentPadding,
      this.showClearButton = false,
      this.onChanged,
      this.maxLength,
      this.maxLines = 1,
      this.cursorColor,
      this.borderColor,
      this.borderWidth,
      this.borderRadius,
      this.obscureText,
      this.onSubmitted,
      this.textInputAction,
        this.keyboardType
      })
      : super();

  @override
  _GTTextFieldState createState() => _GTTextFieldState();
}

class _GTTextFieldState extends State<GTTextField> {
  String _text;

  @override
  void initState() {
    super.initState();
    _text = widget.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height ?? 40,
      padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
      decoration: BoxDecoration(
          border: Border.all(
              color: widget.borderColor ?? GTConfigurationTemplate.mainColor,
              width: widget.borderWidth ?? 0.5),
          borderRadius:
              BorderRadius.all(Radius.circular(widget.borderRadius ?? 5.0))),
      child: TextField(
        controller: TextEditingController(text: _text),
        obscureText: widget.obscureText ?? false,
        style: TextStyle(
            color: widget.textColor ?? GTConfigurationTemplate.textColor,
            fontSize: widget.fontSize ?? 14),
        decoration: InputDecoration(
            icon: widget.iconName != null
                ? GTIcon(
                    widget.iconName,
                    color: widget.iconColor,
                    size: widget.iconSize,
                  )
                : null,
            hintText: widget.placeholder,
            hintStyle: TextStyle(
                color:
                    widget.placeholderColor ?? GTUtils.hexToColor('#c4c8d0')),
            border: InputBorder.none,
            contentPadding:
                widget.contentPadding ?? EdgeInsets.fromLTRB(-5, 5, 0, 0),
            suffixIcon: widget.showClearButton
                ? GTButton(
                    child: GTIcon(
                      '&#xe604;',
                      color: GTUtils.hexToColor('#C6C6C6ff'),
                    ),
                    width: widget.height ?? 30,
                    height: widget.height ?? 30,
                    onPressed: (btn) {
                      setState(() {
                        _text = '';
                      });
                    },
                  )
                : null),
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        cursorColor: widget.cursorColor ?? GTConfigurationTemplate.mainColor,
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged(text);
          }
        },
        onSubmitted: (text) {
          if (widget.onSubmitted != null) {
            widget.onSubmitted(text);
          }
        },
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType ?? TextInputType.text,
      ),
    );
  }
}
