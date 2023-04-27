library app_theme;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

part 'app_icon.dart';

part 'app_colors.dart';

part 'app_icons_theme.dart';

part 'app_text_theme.dart';

class AppTheme {
  //Common colors
  static Color get transparentColor => AppColors.transparent;

  //Background colors
  static Color get backgroundPrimaryColor => AppColors.white;

  //Text color
  static Color get buttonTextColor => AppColors.white;
  static Color get primaryTextColor => AppColors.mirage;
  static Color get textSecondaryColor => AppColors.royalBlue;

  //System colors
  static Color get dividerColor => AppColors.linkWater;
  static Color get accentDividerColor => AppColors.titanWhite;
  static Color get dropDownBgColor => AppColors.selago;
  static Color get dropDownTextColor => AppColors.gray;
  static Color get dropDownBorderColor => AppColors.titanWhite;
  static Color get shadowColor => AppColors.blackPearl31;

  //Button colors
  static const Color buttonBgColor = AppColors.royalBlue;
  static const Color buttonDisabledBgColor = AppColors.cornflowerBlue;
  static const Color buttonSecondaryDisabledBgColor = AppColors.mercury;

  //Gradient colors
  static const List<Color> dashboardGradient = <Color>[
    AppColors.hawkesBlue,
    AppColors.blueChalk,
  ];

  static const List<Color> userProfileGradient = <Color>[
    AppColors.titanWhite,
    AppColors.selago,
  ];
}
