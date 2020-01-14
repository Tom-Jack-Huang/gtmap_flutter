import 'package:flutter/material.dart';
import 'gt_text.dart';
import 'gt_image.dart';
import '../gt_configuration_template.dart';

class GTAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String titleStr;
  final Widget customTitle;
  final Widget customFlexible;
  final String backgroundImageName;
  final String titleColor;
  final Brightness statusBarStyleLightInitially;
  final Widget customLeading;
  final Color backButtonColor;
  final List<Widget> actions;
  final double elevation;
  @override
  final Size preferredSize;
  GTAppBar(
      {this.titleStr,
      this.customTitle,
      this.customFlexible,
      this.backgroundImageName,
      this.titleColor,
      this.statusBarStyleLightInitially,
      this.customLeading,
      this.backButtonColor,
      this.actions,this.elevation})
      : preferredSize = Size.fromHeight(GTConfigurationTemplate.kToolbarHeight),
        super();
  @override
  _GTAppBarState createState() => _GTAppBarState();
}

class _GTAppBarState extends State<GTAppBar> {
  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic> parentRoute = ModalRoute.of(context);
    final bool canPop = parentRoute?.canPop ?? false;
    final double topPadding = MediaQuery.of(context).padding.top;
    return AppBar(
      centerTitle: true,
      title: widget.customTitle ??
          GTText(
            widget.titleStr ?? '',
            fontSize: 18,
            fontWeight: FontWeight.bold,
            hexColor: widget.titleColor ?? GTConfigurationTemplate.navBarTitleColor,
          ),
      flexibleSpace: widget.customFlexible ??
          (widget.backgroundImageName != null
              ? GTImage(
                  widget.backgroundImageName,
                  height: topPadding+GTConfigurationTemplate.kToolbarHeight,
                )
              : null),
      brightness: widget.statusBarStyleLightInitially ?? GTConfigurationTemplate.statusBarStyleLightInitially,
      leading: widget.customLeading ??
          (canPop?BackButton(
            color: widget.backButtonColor ?? GTConfigurationTemplate.navBarTintColor,
          ):null),
      actions: widget.actions,
      backgroundColor: GTConfigurationTemplate.navBarBarTintColor,
      elevation: widget.elevation??1,
    );
  }
}
