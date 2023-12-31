import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/view/components/app-bar/custom_appbar.dart';
import 'package:customer/view/screens/ride/active_ride/active_ride_screen.dart';
import 'package:customer/view/screens/ride/complete_ride/complete_ride_section.dart';
import 'package:customer/view/screens/ride/widget/cancel_ride_card.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RideScreen extends StatefulWidget {
  const RideScreen({super.key});

  @override
  State<RideScreen> createState() => _RideScreenState();
}

class _RideScreenState extends State<RideScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.screenBgColor,
      appBar: const CustomAppBar(title: MyStrings.ride),
      body: SingleChildScrollView(
        padding: Dimensions.screenPaddingHV,
        child: Column(
          children: [
            DefaultTabController(
              length: 3,
              initialIndex: 0,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: Dimensions.space20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: MyColor.colorGrey,
                        ),
                      ),
                    ),
                    child: TabBar(
                      splashBorderRadius: BorderRadius.circular(25),
                      dividerColor: MyColor.bodyText,
                      indicator: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: MyColor.primaryColor, width: 2),
                        ),
                      ),
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelColor: MyColor.colorBlack,
                      labelPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      unselectedLabelColor: MyColor.colorBlack,
                      onTap: (i) {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                      tabs: [
                        Tab(
                          text: MyStrings.activeride.tr,
                        ),
                        Tab(
                          text: MyStrings.completeRide.tr,
                        ),
                        Tab(
                          text: MyStrings.cancelRide.tr,
                        ),
                      ],
                    ),
                  ),
                  Builder(
                    builder: (_) {
                      if (selectedIndex == 0) {
                        return const ActiveRideSection();
                      } else if (selectedIndex == 1) {
                        return const CompleteRideSection();
                      } else {
                        return Column(
                          children: List.generate(10, (index) => const CancelRideCard()),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: Dimensions.space20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
