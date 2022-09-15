import 'package:flutter/material.dart';
import '../colors/colors.dart';
import 'app_text/app_text.dart';

class ResponsiveButton extends StatelessWidget {
  final bool isResponsive;
  final double? width;

  const ResponsiveButton({Key? key, this.width, this.isResponsive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isResponsive ? width : double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.mainColor,
        ),
        height: 55,
        child: Row(
          mainAxisAlignment: isResponsive == true
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (isResponsive == true)
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: const AppText(
                  text: 'Ամրագրել հիմա',
                  color: Colors.white,
                ),
              )
            else
              const SizedBox(),
            Image.asset('img/button-one.png'),
          ],
        ),
      ),
    );
  }
}
