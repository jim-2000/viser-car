import 'package:customer/core/helper/date_converter.dart';
import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_icons.dart';
import 'package:customer/core/utils/my_images.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/core/utils/style.dart';
import 'package:customer/core/utils/util.dart';
import 'package:customer/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:customer/view/components/buttons/rounded_button.dart';
import 'package:customer/view/components/image/custom_svg_picture.dart';
import 'package:customer/view/screens/ride/widget/review_bottom_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompleteRideCard extends StatelessWidget {
  const CompleteRideCard({super.key});

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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.star,
                            size: 12,
                            color: MyColor.colorYellow,
                          ),
                          Text(
                            "4.5",
                            style: boldDefault.copyWith(color: MyColor.colorGrey, fontSize: Dimensions.fontDefault, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "\$569.00",
                style: boldLarge.copyWith(fontSize: 16, fontWeight: FontWeight.w700, color: MyColor.rideTitle),
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.space20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSvgPicture(
                image: MyIcons.mapRed,
                color: MyColor.colorRed,
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: Dimensions.space5 + 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "From",
                              style: boldLarge.copyWith(color: MyColor.rideTitle, fontSize: Dimensions.fontLarge, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.space5 - 1,
                          ),
                          Text(
                            "2972 Westheimer Rd. Santa Ana, Illinois 85486",
                            style: regularDefault.copyWith(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: Dimensions.space12),
            child: Image.asset(
              MyImages.line,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomSvgPicture(
                image: MyIcons.mapYellow,
                color: MyColor.colorYellow,
                height: 24,
                width: 24,
              ),
              const SizedBox(
                width: Dimensions.space5 + 1,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "To",
                              style: boldLarge.copyWith(color: MyColor.rideTitle, fontSize: Dimensions.fontLarge, fontWeight: FontWeight.w700),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(
                            height: Dimensions.space5 - 1,
                          ),
                          Text(
                            "1901 Thornridge Cir. Shiloh, Hawaii 81063",
                            style: regularDefault.copyWith(color: Colors.grey.shade500, fontSize: 12, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: Dimensions.space5 + 3,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const CustomSvgPicture(
                                    image: MyIcons.bag,
                                    height: Dimensions.space10,
                                    width: Dimensions.space10,
                                    color: MyColor.rideTitle,
                                  ),
                                  const SizedBox(
                                    width: Dimensions.space5 - 1,
                                  ),
                                  Text(
                                    "2Kg",
                                    style: boldDefault.copyWith(color: MyColor.colorGreyIcon, fontSize: Dimensions.fontDefault - 1),
                                  )
                                ],
                              ),
                              Container(
                                height: 15,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(border: Border.all(color: MyColor.colorGrey, width: .5)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const CustomSvgPicture(
                                    image: MyIcons.box,
                                    height: Dimensions.space10,
                                    width: Dimensions.space10,
                                    color: MyColor.rideTitle,
                                  ),
                                  const SizedBox(
                                    width: Dimensions.space5 - 1,
                                  ),
                                  Text(
                                    "12ftX10ft",
                                    style: boldDefault.copyWith(color: MyColor.colorGreyIcon, fontSize: Dimensions.fontDefault - 1),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: Dimensions.space20,
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: MyColor.colorGrey2.withOpacity(0.5),
              borderRadius: BorderRadius.circular(Dimensions.mediumRadius),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  MyStrings.ridecompleted,
                  style: boldDefault.copyWith(color: MyColor.colorGrey),
                ),
                Text(
                  DateConverter.estimatedDate(DateTime.now()),
                  style: boldDefault.copyWith(color: MyColor.colorGrey),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Dimensions.space20,
          ),
          RoundedButton(
            text: MyStrings.review,
            press: () {
              //note: open reveiw bottom sheet form here
              CustomBottomSheet(child: const ReviewBottomSheet()).customBottomSheet(context);
            },
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
}

class DottedBorderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF9E9E9E)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double dashWidth = 3; // Width of each dash
    double dashSpace = 5; // Space between each dash

    double startX = 0;

    // Draw bottom border
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height),
        Offset(startX + dashWidth, size.height),
        paint,
      );
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}
