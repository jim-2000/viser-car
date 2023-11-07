import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/view/screens/ride/widget/complete_ride_card.dart';
import 'package:flutter/material.dart';

class CompleteRideSection extends StatelessWidget {
  const CompleteRideSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: List.generate(
            4,
            (index) => CompleteRideCard(
              isPaymentDone: index == 0 ? false : true,
              isReviewDone: index == 0 ? false : true,
            ),
          ),
        ),
      ],
    );
  }
}
