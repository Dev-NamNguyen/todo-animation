import 'package:flutter/material.dart';
import 'package:todo_animation/core/res/color/base.colors.dart';

class AppColors extends BaseColors {
  @override
  Color get primary => Colors.white;

  @override
  Color get title => Colors.black;

  @override
  Color get subtitle => Colors.black26;

  @override
  Color get checkActive => Colors.grey[800] ?? Colors.grey.shade800;
}
