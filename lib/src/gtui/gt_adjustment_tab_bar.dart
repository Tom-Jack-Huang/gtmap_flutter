import 'package:flutter/material.dart';
import 'gt_button.dart';
import 'gt_icon.dart';
import 'gt_image.dart';
import '../gt_configuration_template.dart';

class GTAdjustmentTabBat extends StatefulWidget {
  final List items; //数据格式为[{'title':'','icon':''}]
  final ValueChanged<int> onTap;
  final double iconSize;
  final double selectedFontSize;
  final double unselectedFontSize;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final String centerIcon;
  final String centerImage;
  final String centerTitle;
  final double centerSize;
  final double centerTopOffSize;
  final Color backgroundColor;
  final Color tabBarShadowImageColor;
  final double centerImageSize;
  final double titlePositionAdjustment;
  GTAdjustmentTabBat(
      {Key key,
      @required this.items,
      this.onTap,
      this.iconSize,
      this.unselectedFontSize,
      this.selectedFontSize,
      this.selectedIconColor,
      this.selectedItemColor,
      this.unselectedIconColor,
      this.unselectedItemColor,
      this.centerIcon,
      this.centerSize,
      this.centerTitle,
      this.centerTopOffSize,
      this.centerImage,
      this.backgroundColor,
      this.tabBarShadowImageColor,
      this.centerImageSize,
      this.titlePositionAdjustment})
      : super(key: key);

  @override
  _GTAdjustmentTabBatState createState() => _GTAdjustmentTabBatState();
}

class _GTAdjustmentTabBatState extends State<GTAdjustmentTabBat> {
  List<Widget> _myTabs;
  int _index;
  @override
  void initState() {
    super.initState();
    _index = 0;
    _myTabs = [];
  }

  getViews(BuildContext context) {
    int _centerIndex = widget.items.length ~/ 2;

    _myTabs?.clear();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    for (int i = 0; i < widget.items.length; i++) {
      Map item = widget.items[i];
      _myTabs.add(Positioned(
          bottom: 0,
          left: i < _centerIndex ? (width / (widget.items.length + 1) * i) : (width / (widget.items.length + 1) * (i + 1)),
          child: GTButton(
            onPressed: (btn) {
              setState(() {
                _index = i < _centerIndex ? i : i + 1;
              });
              if (widget.onTap != null) {
                widget.onTap((i < _centerIndex ? i : i + 1));
              }
            },
            child: Column(
              children: <Widget>[
                GTIcon(
                  item['icon'],
                  size: widget.iconSize ?? 24,
                  color: _index == (i < _centerIndex ? i : i + 1)
                      ? (widget.selectedIconColor ?? GTConfigurationTemplate.tabBarItemTitleColorSelected)
                      : (widget.unselectedIconColor ?? GTConfigurationTemplate.tabBarItemTitleColor),
                ),
                Text(
                  item['title'],
                  style: TextStyle(
                      color: _index == (i < _centerIndex ? i : i + 1)
                          ? (widget.selectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColorSelected)
                          : (widget.unselectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColor),
                      fontSize: _index == (i < _centerIndex ? i : i + 1) ? (widget.selectedFontSize ?? 12) : (widget.unselectedFontSize ?? 12)),
                )
              ],
            ),
          )));
    }
    _myTabs.insert(
        _centerIndex,
        Positioned(
            left: width / (widget.items.length + 1) * _centerIndex,
            top: widget.centerTopOffSize,
            child: GTButton(
              onPressed: (btn) {
                setState(() {
                  _index = _centerIndex;
                });
                if (widget.onTap != null) {
                  widget.onTap(_centerIndex);
                }
              },
              child: Column(
                children: <Widget>[
                  widget.centerIcon != null
                      ? GTIcon(
                          widget.centerIcon,
                          size: widget.centerSize ?? GTConfigurationTemplate.iconSize,
                          color: _index == _centerIndex
                              ? (widget.selectedIconColor ?? GTConfigurationTemplate.tabBarItemTitleColorSelected)
                              : (widget.unselectedIconColor ?? GTConfigurationTemplate.tabBarItemTitleColor),
                        )
                      : GTImage(
                          widget.centerImage,
                          width: widget.centerImageSize ?? 49,
                          height: widget.centerImageSize ?? 49,
                          fit: BoxFit.fill,
                        ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, widget.titlePositionAdjustment??0, 0, 0),
                    child: Text(
                      widget.centerTitle ?? '',
                      style: TextStyle(
                          color: _index == _centerIndex
                              ? (widget.selectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColorSelected)
                              : (widget.unselectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColor),
                          fontSize: _index == _centerIndex ? (widget.selectedFontSize ?? 12) : (widget.unselectedFontSize ?? 12)),
                    ),
                  )
                ],
              ),
            )));
    return _myTabs;
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      height: GTConfigurationTemplate.kTabBarHeight + bottomPadding+0.5,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? GTConfigurationTemplate.tabBarBarTintColor,
          border: Border(top: BorderSide(color: widget.tabBarShadowImageColor ?? GTConfigurationTemplate.tabBarShadowImageColor, width: 0.5))),
      child: Column(
        children: <Widget>[
          Container(
            height: GTConfigurationTemplate.kTabBarHeight,
            width: double.infinity,
            child: Stack(
              overflow: Overflow.visible,
              children: getViews(context),
            ),
          )
        ],
      ),
    );
  }
}
