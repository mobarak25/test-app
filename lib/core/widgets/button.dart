import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/core/utils/asset_image.dart';
import 'package:test_app/core/utils/colors.dart';
import 'package:test_app/core/utils/text_styles.dart';

import 'text.dart';

class ButtonB extends StatelessWidget {
  final String? text;
  final Color? textColor;
  final Color borderColor;
  final Color? bgColor;
  final double? heigh;
  final bool? shadow;
  final double? fontSize;
  final VoidCallback press;
  final bool loading;
  final FontWeight fontWeight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String suffixIcon;
  final double? suffixIconSize;
  final List<Color> gradientColors;

  const ButtonB(
      {Key? key,
      required this.text,
      this.textColor = bWhite,
      this.bgColor,
      this.suffixIcon = logoLogoSvg,
      this.suffixIconSize,
      this.borderColor = Colors.transparent,
      this.heigh = 20,
      this.shadow = false,
      required this.press,
      this.fontSize = 17,
      this.fontWeight = FontWeight.w500,
      this.loading = false,
      this.horizontalPadding,
      this.verticalPadding,
      this.gradientColors = const [
        Color(0XFF59A3FF),
        Color(0XFF1B5EF5),
      ]})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(7),
        child: Ink(
          height: heigh,
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding ?? 10),
          decoration: BoxDecoration(
            color: bgColor,
            gradient: bgColor == null
                ? LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: gradientColors,
                  )
                : null,
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: borderColor),
            boxShadow: shadow!
                ? const [
                    BoxShadow(
                      color: bWhite,
                      offset: Offset(-3.62, -2.41), //(x,y)
                      blurRadius: 4.83,
                    ),
                    BoxShadow(
                      color: Color(0xFFB9BCCB),
                      offset: Offset(2.41, 3.62), //(x,y)
                      blurRadius: 4.83,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextB(
                text: text!,
                fontColor: textColor,
                textStyle: bBody1M,
              ),
              const SizedBox(width: 20),
              loading
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 1.5,
                      ),
                    )
                  : SvgPicture.asset(
                      suffixIcon,
                      width: suffixIconSize,
                      colorFilter:
                          ColorFilter.mode(textColor!, BlendMode.srcIn),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
