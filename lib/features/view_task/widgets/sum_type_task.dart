import 'package:flutter/material.dart';
import 'package:todo_animation/core/res/app.context.extension.dart';
import 'package:todo_animation/core/res/resources.dart';

class SumTypeTask extends StatelessWidget {
  final Widget? icon;
  final String? title;
  final String? subTitle;
  final Color? color;
  final double? width;
  final double? height;

  const SumTypeTask(
      {super.key,
      this.icon,
      this.title,
      this.subTitle,
      this.color,
      this.width = double.infinity,
      this.height = 100});

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(resources.dimensions.primaryPadding),
      decoration: BoxDecoration(
        color: color ?? resources.colors.primary,
        borderRadius: BorderRadius.circular(resources.dimensions.primaryRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          icon!,
          Row(
            children: [
              Text(
                title ?? "",
                style: TextStyle(
                  color: resources.colors.title,
                  fontSize: resources.sizes.primaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                subTitle ?? "",
                style: TextStyle(
                    color: resources.colors.subtitle,
                    fontSize: resources.sizes.primaryText,
                    fontWeight: FontWeight.w700),
              ),
            ],
          )
        ],
      ),
    );
  }
}
