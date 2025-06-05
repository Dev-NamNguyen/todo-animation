import 'package:flutter/material.dart';
import 'package:todo_animation/core/res/resources.dart';

extension AppContextExtension on BuildContext {
  Resources get resources => Resources.of(this);
}
