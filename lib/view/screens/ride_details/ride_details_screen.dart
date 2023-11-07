import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/view/components/app-bar/custom_appbar.dart';
import 'package:customer/view/screens/ride_details/widget/bid_card.dart';
import 'package:customer/view/screens/ride_details/widget/ride_details_card.dart';
import 'package:flutter/material.dart';

class RideDetailsScreen extends StatelessWidget {
  const RideDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: MyStrings.rideDetails),
      body: SingleChildScrollView(
        padding: Dimensions.screenPaddingHV,
        child: Column(
          children: [
            const RideDetailsCard(),
            const SizedBox(
              height: Dimensions.space20,
            ),
            Column(
              children: List.generate(
                2,
                (index) => const BidCard(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
