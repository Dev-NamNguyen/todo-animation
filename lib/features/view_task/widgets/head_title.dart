import 'package:flutter/material.dart';
import 'package:todo_animation/core/res/app.context.extension.dart';
import 'package:todo_animation/core/res/resources.dart';

class HeadTitle extends StatelessWidget {
  final String? title;
  final String? subTitle;
  final Function? onTap;

  const HeadTitle(
      {super.key, required this.title, required this.subTitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    final Resources resources = context.resources;

    return InkWell(
      onTap: onTap as void Function()?,
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: "$title ",
            style: TextStyle(
                fontSize: resources.sizes.headline1,
                color: resources.colors.title,
                fontWeight: FontWeight.bold)),
        TextSpan(
          text: subTitle,
          style: TextStyle(
              fontSize: resources.sizes.headline1,
              color: resources.colors.subtitle,
              fontWeight: FontWeight.w500),
        ),
      ])),
    );
  }
}
