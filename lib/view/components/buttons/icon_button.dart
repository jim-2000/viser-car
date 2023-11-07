import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/style.dart';
import 'package:flutter/material.dart';

import 'package:customer/core/utils/my_color.dart';
import 'package:customer/view/components/image/custom_svg_picture.dart';
import 'package:get/get.dart';

class CustomIconButton extends StatelessWidget {
  final String name;
  final String icon;
  Color? textColor;
  Color? iconColor;
  TextStyle? style;
  double? iconSize;
  bool? isSvg = false;
  final VoidCallback press;

  CustomIconButton({
    Key? key,
    required this.name,
    required this.icon,
    required this.press,
    this.textColor,
    this.iconColor,
    this.style,
    this.iconSize = 16,
    this.isSvg = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
        decoration: BoxDecoration(
          color: MyColor.rideTitle,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            isSvg!
                ? CustomSvgPicture(
                    image: icon,
                    height: iconSize ?? 12,
                    width: iconSize ?? 12,
                    color: iconColor ?? MyColor.colorWhite,
                  )
                : Image.asset(
                    icon,
                    height: iconSize,
                    width: iconSize,
                    color: iconColor,
                  ),
            const SizedBox(
              width: Dimensions.space10,
            ),
            Text(
              name.tr,
              style: style ?? boldDefault.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: MyColor.colorWhite),
            ),
          ],
        ),
      ),
    );
  }
}
