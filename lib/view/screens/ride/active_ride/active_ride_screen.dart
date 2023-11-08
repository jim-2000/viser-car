import 'package:customer/core/route/route.dart';
import 'package:customer/view/screens/ride/widget/activeride_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveRideSection extends StatelessWidget {
  const ActiveRideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            4,
            (index) => GestureDetector(
              onTap: () => Get.toNamed(RouteHelper.rideDetailsScreen),
              child: ActiveRideCard(
                isActive: index == 0 ? true : false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
