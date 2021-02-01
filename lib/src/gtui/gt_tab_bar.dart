import 'package:flutter/material.dart';
import 'gt_button.dart';
import 'gt_image.dart';
import '../gt_configuration_template.dart';

class GTTabBar extends StatefulWidget {
  final List items; //数据格式为[{'title':'','icon':'','sel_icon':''}]
  final ValueChanged<int> onTap;
  final double iconSize;
  final double selectedFontSize;
  final double unselectedFontSize;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color backgroundColor;
  final Color tabBarShadowImageColor;
  final double titlePositionAdjustment;
  GTTabBar(
      {Key key,
      @required this.items,
      this.iconSize,
      this.selectedFontSize,
      this.unselectedFontSize,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.onTap,
      this.selectedIconColor,
      this.unselectedIconColor,
      this.backgroundColor,
      this.tabBarShadowImageColor,
      this.titlePositionAdjustment})
      : super(key: key);

  @override
  _GTTabBarState createState() => _GTTabBarState();
}

class _GTTabBarState extends State<GTTabBar> {
  List<Widget> _myTabs;
  int _index;
  @override
  void initState() {
    super.initState();
    _index = 0;
    _myTabs = [];
  }

  getViews(BuildContext context) {
    _myTabs?.clear();
    final size = MediaQuery.of(context).size;
    final width = size.width;
    for (int i = 0; i < widget.items.length; i++) {
      Map item = widget.items[i];
      _myTabs.add(Positioned(
          top: 0,
          left: (width / (widget.items.length) * i),
          width: width / widget.items.length,
          child: GTButton(
            padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
            onPressed: (btn) {
              setState(() {
                _index = i;
              });
              if (widget.onTap != null) {
                widget.onTap(i);
              }
            },
            child: Column(
              children: <Widget>[
                GTImage(
                  _index == i ? item['sel_icon'] : item['icon'],
                  width: 24,
                  height: 24,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, widget.titlePositionAdjustment ?? 0, 0, 0),
                  child: Text(
                    item['title'],
                    style: TextStyle(
                        color: _index == i
                            ? (widget.selectedItemColor ??
                                GTConfigurationTemplate
                                    .tabBarItemTitleColorSelected)
                            : (widget.unselectedItemColor ??
                                GTConfigurationTemplate.tabBarItemTitleColor),
                        fontSize: _index == i
                            ? (widget.selectedFontSize ?? 12)
                            : (widget.unselectedFontSize ?? 12)),
                  ),
                )
              ],
            ),
          )));
    }
    return _myTabs;
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      height: GTConfigurationTemplate.kTabBarHeight + bottomPadding + 0.5,
      decoration: BoxDecoration(
          color: widget.backgroundColor ??
              GTConfigurationTemplate.tabBarBarTintColor,
          border: Border(
              top: BorderSide(
                  color: widget.tabBarShadowImageColor ??
                      GTConfigurationTemplate.tabBarShadowImageColor,
                  width: 0.5))),
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
