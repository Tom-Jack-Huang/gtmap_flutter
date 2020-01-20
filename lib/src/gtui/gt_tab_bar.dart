import 'package:flutter/material.dart';
import '../gt_configuration_template.dart';
import '../utils/gt_util.dart';

class GTTabBar extends StatefulWidget {
  final List<Map> items; //数据格式为[{'title':'','icon':''}]
  final double iconSize;
  final BottomNavigationBarType type;
  final double selectedFontSize;
  final double unselectedFontSize;
  final Color selectedItemColor;
  final Color unselectedItemColor;
  final Color selectedIconColor;
  final Color unselectedIconColor;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  GTTabBar(
      {Key key,
      @required this.items,
      this.iconSize,
      this.type,
      this.selectedFontSize,
      this.unselectedFontSize,
      this.selectedItemColor,
      this.unselectedItemColor,
      this.onTap,
      this.selectedIconColor,
      this.unselectedIconColor,
      this.backgroundColor})
      : super(key: key);

  @override
  _GTTabBarState createState() => _GTTabBarState();
}

class _GTTabBarState extends State<GTTabBar> {
  List<BottomNavigationBarItem> _myTab = [];
  int _index = 0;
  @override
  void initState() {
    super.initState();
    for (Map item in widget.items) {
      _myTab.add(BottomNavigationBarItem(
          icon: Icon(IconData(GTUtils.getIconFontFromString(item['icon']), fontFamily: GTConfigurationTemplate.fontFamily)),
          activeIcon: Icon(IconData(GTUtils.getIconFontFromString(item['icon']), fontFamily: GTConfigurationTemplate.fontFamily)),
          title: Container(
            margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
            child: Text(item['title']),
          )));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double bottomPadding = MediaQuery.of(context).padding.bottom;
    return Container(
      height: 49.0 + bottomPadding,
      child: BottomNavigationBar(
        items: _myTab,
        type: widget.type ?? BottomNavigationBarType.fixed,
        backgroundColor: widget.backgroundColor ?? GTConfigurationTemplate.tabBarBarTintColor,
        selectedItemColor: widget.selectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColorSelected,
        unselectedItemColor: widget.unselectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColor,
        selectedIconTheme:
            IconThemeData(color: widget.selectedIconColor ?? widget.selectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColorSelected, size: widget.iconSize ?? 24),
        unselectedIconTheme:
            IconThemeData(color: widget.unselectedIconColor ?? widget.unselectedItemColor ?? GTConfigurationTemplate.tabBarItemTitleColor, size: widget.iconSize ?? 24),
        selectedLabelStyle: TextStyle(
          fontSize: widget.selectedFontSize ?? 12,
        ),
        unselectedLabelStyle: TextStyle(fontSize: widget.unselectedFontSize ?? 12),
        currentIndex: _index,
        onTap: (index) {
          setState(() {
            _index = index;
          });
          if (widget.onTap != null) {
            widget.onTap(index);
          }
        },
      ),
    );
  }
}
