import 'package:flutter/material.dart'; // Import Material.dart for TextStyle
import '../appColors/app_colors.dart';


class HomeScreenStyles {

  // appBarStyles
  static const TextStyle appBarUpperTitleStyles = TextStyle(
    color: AppColors.baseBlackColor, // Access the color from AppColors
    fontWeight: FontWeight.bold,
  );
  // appBarBottomTitleStyles
  static const TextStyle appBarBottomTitleStyles = TextStyle(
    color: Colors.grey, // Access the color from AppColors
    fontSize: 13,
  );

}