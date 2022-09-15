import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'app_text/app_text.dart';

class AppButtons extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final Color color;
  final Color backgroundColor;
  final double size;
  final Color borderColor;
  final bool? isIcon;

  const AppButtons({
    Key? key,
    required this.color,
    required this.backgroundColor,
    required this.borderColor,
    required this.size,
    this.text = 'test',
    this.icon,
    this.isIcon = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(15),
        color: backgroundColor,
      ),
      child: isIcon == false
          ? Center(
              child: AppText(
                text: text!,
                color: color,
              ),
            )
          : Center(
              child: Icon(
                icon,
                color: color,
              ),
            ),
    );
  }
}
