import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_images.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/core/utils/style.dart';
import 'package:customer/core/utils/util.dart';
import 'package:customer/view/components/buttons/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BidCard extends StatelessWidget {
  const BidCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: MyColor.getCardBgColor(),
        borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
        boxShadow: MyUtils.getCardShadow(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    MyImages.profile,
                    height: 45,
                    width: 45,
                  ),
                  const SizedBox(
                    width: Dimensions.space10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Martin Komas",
                        style: regularDefault.copyWith(fontSize: 16),
                      ),
                      Row(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(
                                Icons.star,
                                size: 12,
                                color: MyColor.colorYellow,
                              ),
                              const SizedBox(
                                width: Dimensions.space2,
                              ),
                              Text(
                                "4.5",
                                style: boldDefault.copyWith(color: MyColor.colorGrey, fontSize: Dimensions.fontDefault, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: Dimensions.space8,
                          ),
                          Text(
                            "20 min, 1.05km",
                            style: boldDefault.copyWith(color: MyColor.primaryColor),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "\$500.00",
                style: boldLarge.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: MyColor.rideTitle),
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.space20,
          ),
          Text(
            MyStrings.riderulse.tr,
            style: boldLarge.copyWith(),
          ),
          const SizedBox(
            height: Dimensions.space20,
          ),
          rulseData(text: "Eating is to allowed in the car"),
          rulseData(text: "No smoking"),
          rulseData(text: "No sex"),
          rulseData(text: "Pet not allowed"),
          const SizedBox(
            height: Dimensions.space20,
          ),
          RoundedButton(
            text: MyStrings.acceptride,
            press: () {},
            cornerRadius: 8,
            verticalPadding: 15,
            color: MyColor.rideTitle,
            textColor: MyColor.colorWhite,
          ),
          const SizedBox(
            height: Dimensions.space10,
          ),
        ],
      ),
    );
  }

  Widget rulseData({required String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: MyColor.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: Dimensions.space8,
          ),
          Text(
            text,
            style: regularDefault.copyWith(color: MyColor.bodyTextColor),
          )
        ],
      ),
    );
  }
}
