import 'package:flutter/material.dart';
import 'package:todo_animation/core/res/color/app.colors.dart';
import 'package:todo_animation/core/res/color/base.colors.dart';
import 'package:todo_animation/core/res/dimension/app.dimensions.dart';
import 'package:todo_animation/core/res/dimension/base.dimensions.dart';
import 'package:todo_animation/core/res/size/app.sizes.dart';
import 'package:todo_animation/core/res/size/base.sizes.dart';

class Resources {
  final BuildContext context;

  Resources(this.context);
  BaseColors get colors => AppColors();
  BaseSizes get sizes => AppSizes();
  BaseDimensions get dimensions => AppDimensions();

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
