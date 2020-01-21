import 'package:flutter/material.dart';
import 'utils/gt_util.dart';
class GTConfigurationTemplate {
  static double kToolbarHeight = 44.0;
  static double kTabBarHeight = 49.0;
  static Brightness statusBarStyleLightInitially = Brightness.dark;
  static String fontFamily = 'IconFont';
  static double iconSize = 16.0;


  static Color mainColor= GTUtils.hexToColor('#FF9900');
  static Color fillButtonColor = GTUtils.hexToColor('#FF9900');
  static Color ghostButtonColor = GTUtils.hexToColor('#FF9900');
  static Color textColor = GTUtils.hexToColor('#333333');
  static int buttonHighlightedAlpha = 80;

  static String navBarTitleColor = '#FFFFFF';
  static Color navBarBarTintColor = GTUtils.hexToColor('#FF0000');
  static Color navBarTintColor = GTUtils.hexToColor('#FFFFFF');

  static Color tabBarItemTitleColor = GTUtils.hexToColor('#929292');
  static Color tabBarItemTitleColorSelected = GTUtils.hexToColor('#FF9900');
  static Color tabBarBarTintColor = GTUtils.hexToColor('#F9F9F9');
  static Color tabBarShadowImageColor = Colors.black12;
}