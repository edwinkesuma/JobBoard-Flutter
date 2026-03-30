import 'package:flutter/material.dart';
import 'package:job_board/core/constants/app_dimensions.dart';

class ResponsiveHelper {
  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < AppDimensions.breakPoint;
  }
}
