import 'package:flutter/material.dart';
import 'package:customer/core/route/route.dart';
import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/style.dart';
import 'package:customer/core/utils/url_container.dart';
import 'package:customer/data/controller/home/home_controller.dart';
import 'package:customer/view/components/circle_image_button.dart';
import 'package:get/get.dart';

class TopSection extends StatefulWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  State<TopSection> createState() => _TopSectionState();
}

class _TopSectionState extends State<TopSection> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: Dimensions.space20, horizontal: Dimensions.space10),
        decoration: BoxDecoration(color: MyColor.getPrimaryColor()),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleImageWidget(
                      height: 40,
                      width: 40,
                      isProfile: true,
                      isAsset: false,
                      imagePath: '${UrlContainer.domainUrl}/assets/images/user/profile/${controller.imagePath}',
                      press: () {
                        Get.toNamed(RouteHelper.profileScreen);
                      }),
                  const SizedBox(width: Dimensions.space10),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.username, style: regularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500)),
                      const SizedBox(height: Dimensions.space5),
                      Text(
                        controller.email,
                        style: regularDefault.copyWith(color: MyColor.colorWhite, fontWeight: FontWeight.w500),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ],
                  ))
                ],
              ),
            ),
            const SizedBox(width: Dimensions.space15),
          ],
        ),
      ),
    );
  }
}
