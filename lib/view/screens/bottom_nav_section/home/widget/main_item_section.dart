import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_images.dart';
import 'package:customer/data/controller/home/home_controller.dart';

import '../../../../../core/route/route.dart';
import '../../../../../core/utils/my_strings.dart';
import '../../../../components/buttons/circle_animated_button_with_text.dart';
import '../../../../components/image/custom_svg_picture.dart';

class MainItemSection extends StatelessWidget {
  const MainItemSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space15, horizontal: Dimensions.space10),
        decoration: BoxDecoration(color: MyColor.getCardBgColor()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: CircleAnimatedButtonWithText(buttonName: MyStrings.depositHistory, backgroundColor: MyColor.screenBgColor, child: Image.asset(MyImages.addMoneyHistory, color: MyColor.primaryColor, height: 20, width: 20), onTap: () => Get.toNamed(RouteHelper.addMoneyHistoryScreen))),
                Expanded(
                    child: CircleAnimatedButtonWithText(
                        buttonName: MyStrings.transactions,
                        //height: 40, width: 40,
                        backgroundColor: MyColor.screenBgColor,
                        child: const CustomSvgPicture(image: MyImages.viewTransaction, color: MyColor.primaryColor, height: 20, width: 20),
                        onTap: () => Get.toNamed(RouteHelper.transactionHistoryScreen))),
                Expanded(child: CircleAnimatedButtonWithText(buttonName: MyStrings.withdrawHistory, backgroundColor: MyColor.screenBgColor, child: Image.asset(MyImages.withdrawHistory, color: MyColor.primaryColor, height: 20, width: 20), onTap: () => Get.toNamed(RouteHelper.withdrawScreen))),
                Expanded(
                    child: CircleAnimatedButtonWithText(
                  buttonName: MyStrings.withdrawMoney,
                  backgroundColor: MyColor.screenBgColor,
                  child: Image.asset(MyImages.withdrawMoney, height: 20, width: 20, color: MyColor.primaryColor),
                  onTap: () => Get.toNamed(RouteHelper.addWithdrawMethodScreen),
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
