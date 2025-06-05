import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

String getDate() {
  final DateTime now = DateTime.now();
  return DateFormat('d MMM').format(now);
}

Color getColorFromHex(String hexColor) {
  return Color(int.parse(
    hexColor,
  ));
}
