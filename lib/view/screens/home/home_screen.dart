import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_images.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/core/utils/style.dart';
import 'package:customer/core/utils/util.dart';
import 'package:customer/data/controller/home/home_controller.dart';
import 'package:customer/data/repo/home/home_repo.dart';
import 'package:customer/data/services/api_service.dart';
import 'package:customer/view/components/bottom-sheet/bottom_sheet_header_row.dart';
import 'package:customer/view/components/bottom-sheet/custom_bottom_sheet.dart';
import 'package:customer/view/components/buttons/rounded_button.dart';
import 'package:customer/view/components/image/custom_svg_picture.dart';
import 'package:customer/view/components/text-form-field/custom_text_field.dart';
import 'package:customer/view/components/text-form-field/my_custom_text_field.dart';
import 'package:customer/view/components/text/header_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Get.put(ApiClient(sharedPreferences: Get.find()));
    Get.put(HomeRepo(apiClient: Get.find()));
    Get.put(HomeController(homeRepo: Get.find()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<HomeController>(builder: (controller) {
        return Scaffold(
          backgroundColor: MyColor.screenBgColor,
          body: SingleChildScrollView(
            // padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _homeAppbar(context),
                const SizedBox(height: Dimensions.space20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: Dimensions.space15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.zero,
                        width: context.width,
                        height: context.orientation == Orientation.landscape ? 120 : 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: const DecorationImage(
                            image: AssetImage(MyImages.banner),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.space20),
                      HeaderText(text: MyStrings.selectService, textStyle: boldLarge.copyWith(fontSize: 16)),
                      const SizedBox(height: Dimensions.space15),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          children: List.generate(
                            controller.serviceName.length,
                            (index) => GestureDetector(
                              onTap: () => controller.selectService(controller.serviceName[index]),
                              child: Container(
                                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                                margin: const EdgeInsets.only(right: 8),
                                width: context.orientation == Orientation.landscape ? 120 : 100,
                                height: context.orientation == Orientation.landscape ? 120 : 100,
                                decoration: BoxDecoration(
                                  color: MyColor.colorWhite,
                                  borderRadius: BorderRadius.circular(16),
                                  border: controller.serviceName[index] == controller.selectedId
                                      ? Border.all(
                                          color: MyColor.primaryColor,
                                          width: 2.2,
                                        )
                                      : Border.all(
                                          color: MyColor.colorGrey2,
                                          width: 1.2,
                                        ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      controller.serviceicon[index],
                                      height: 30,
                                    ),
                                    const SizedBox(height: Dimensions.space10),
                                    Text(
                                      controller.serviceName[index],
                                      style: regularDefault.copyWith(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: Dimensions.space20),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
                        decoration: BoxDecoration(color: MyColor.colorWhite, borderRadius: const BorderRadius.only(topRight: Radius.circular(12), topLeft: Radius.circular(12)), boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400.withOpacity(0.07),
                            spreadRadius: 4,
                            blurRadius: 2,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            HeaderText(text: MyStrings.selectDestination, textStyle: boldLarge.copyWith(fontSize: 16)),
                            const SizedBox(height: Dimensions.space15),
                            CustomTextField(
                              onChanged: (val) {},
                              animatedLabel: true,
                              needOutlineBorder: true,
                              labelText: MyStrings.pickUplocation.tr,
                              radius: Dimensions.mediumRadius,
                            ),
                            const SizedBox(height: Dimensions.space20),
                            CustomTextField(
                              onChanged: (val) {},
                              animatedLabel: true,
                              needOutlineBorder: true,
                              labelText: MyStrings.destination.tr,
                              hintText: "",
                              radius: Dimensions.mediumRadius,
                            ),
                            const SizedBox(height: Dimensions.space20),
                            CustomTextField(
                              onChanged: (val) {},
                              animatedLabel: true,
                              needOutlineBorder: true,
                              hintText: "",
                              labelText: MyStrings.offeryourRate.tr,
                              radius: Dimensions.mediumRadius,
                            ),
                            const SizedBox(height: Dimensions.space20),
                            InkWell(
                              onTap: () {
                                CustomBottomSheet(
                                  child: Container(
                                    height: context.height / 1.6,
                                    color: MyColor.colorWhite,
                                    child: const Column(
                                      children: [BottomSheetHeaderRow()],
                                    ),
                                  ),
                                ).customBottomSheet(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(border: Border.all(color: MyColor.borderColor, width: 0.5), borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Text(MyStrings.paymentMethod.tr, style: regularDefault),
                                      ],
                                    ),
                                    const Icon(Icons.arrow_drop_down, color: MyColor.colorGrey),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: Dimensions.space20),
                            RoundedButton(text: MyStrings.bookRide.tr, press: () {}),
                            const SizedBox(height: Dimensions.space10),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  PreferredSize _homeAppbar(BuildContext context) {
    return PreferredSize(
      preferredSize: Size(context.width, 160),
      child: Container(
        padding: Dimensions.screenPaddingHV,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage(
              MyImages.appbarBG,
            ),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(MyColor.colorGrey.withOpacity(0.3), BlendMode.overlay),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.menu,
                  color: MyColor.colorWhite,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage(MyImages.avatar),
                )
              ],
            ),
            const SizedBox(
              height: Dimensions.space10,
            ),
            Container(
              decoration: const BoxDecoration(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderText(
                    text: "Martin Josef",
                    textStyle: boldLarge.copyWith(color: MyColor.colorWhite, fontSize: 18),
                  ),
                  Text(
                    "775 Rolling Green Rd.",
                    style: regularDefault.copyWith(color: MyColor.colorWhite, fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
