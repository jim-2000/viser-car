import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_icons.dart';
import 'package:customer/core/utils/my_images.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/core/utils/style.dart';
import 'package:customer/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:customer/view/components/buttons/rounded_button.dart';
import 'package:customer/view/components/divider/custom_divider.dart';
import 'package:customer/view/components/image/custom_svg_picture.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ReviewBottomSheet extends StatelessWidget {
  const ReviewBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height / 1.5,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const BottomSheetHeaderRow(),
            Text(
              MyStrings.reviewForDriver,
              style: regularDefault.copyWith(fontSize: Dimensions.fontOverLarge - 1),
            ),
            const SizedBox(
              height: Dimensions.space20,
            ),
            Image.asset(
              MyImages.profile,
              height: 75,
              width: 75,
            ),
            const SizedBox(
              height: Dimensions.space8,
            ),
            Text(
              "Martin Komas",
              style: regularDefault.copyWith(fontSize: 16),
            ),
            const SizedBox(
              height: Dimensions.space8,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
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
                Container(
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(border: Border.all(color: MyColor.colorGrey, width: .5)),
                ),
                Row(
                  children: [
                    const CustomSvgPicture(
                      image: MyIcons.suv,
                      color: MyColor.bodyText,
                      height: 10,
                      width: 15,
                    ),
                    const SizedBox(
                      width: Dimensions.space5 - 1,
                    ),
                    Text(
                      "SUV E-160",
                      style: boldDefault.copyWith(color: MyColor.colorGrey, fontSize: Dimensions.fontDefault, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ],
            ),
            const CustomDivider(
              space: Dimensions.space10,
              color: MyColor.bodyText,
            ),
            const SizedBox(
              height: Dimensions.space30,
            ),
            Text(
              MyStrings.ratingDriver.tr,
              style: semiBoldDefault.copyWith(fontSize: Dimensions.fontOverLarge + 2),
            ),
            RatingBar.builder(
              initialRating: 1,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                //changed:  store rating on controller
              },
            ),
            const SizedBox(
              height: Dimensions.space25 - 1,
            ),
            Text(
              MyStrings.whatCouldBebetter.tr,
              style: mediumDefault.copyWith(fontSize: Dimensions.fontOverLarge - 1),
            ),
            const SizedBox(
              height: Dimensions.space12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Wrap(
                runSpacing: 8,
                spacing: 8,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                verticalDirection: VerticalDirection.down,
                children: List.generate(
                  6,
                  (index) => Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                        color: index == 1 ? MyColor.primaryColor : MyColor.transparentColor,
                        borderRadius: const BorderRadius.all(Radius.circular(50)),
                        border: index == 1
                            ? null
                            : Border.all(
                                color: MyColor.borderColor,
                                width: 1,
                              )),
                    child: Text(
                      index == 4 ? "Car Interment" : "Service ${index + 1}",
                      style: regularDefault.copyWith(
                        color: index == 1 ? MyColor.colorWhite : MyColor.bodyText,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: Dimensions.space30 + 2,
            ),
            RoundedButton(
              text: MyStrings.submit,
              color: MyColor.rideTitle,
              textColor: MyColor.colorWhite,
              cornerRadius: 8,
              press: () {
                //changed: submit review
              },
            )
          ],
        ),
      ),
    );
  }
}
