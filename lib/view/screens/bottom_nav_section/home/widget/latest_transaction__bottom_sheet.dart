import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:customer/core/utils/dimensions.dart';
import 'package:customer/core/utils/my_strings.dart';
import 'package:customer/data/controller/home/home_controller.dart';
import 'package:customer/view/components/bottom-sheet/bottom_sheet_close_button.dart';
import 'package:customer/view/components/column_widget/card_column.dart';
import 'package:customer/view/components/divider/custom_divider.dart';
import 'package:customer/view/components/text/bottom_sheet_header_text.dart';

class LatestTransactionBottomSheet extends StatelessWidget {
  final int index;
  const LatestTransactionBottomSheet({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [BottomSheetHeaderText(text: MyStrings.details), BottomSheetCloseButton()],
          ),
          CustomDivider(space: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.transactionId,
                body: "",
              ),
              CardColumn(
                alignmentEnd: true,
                header: MyStrings.wallet,
                body: "",
              )
            ],
          ),
          SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.beforeCharge,
                body: "",
              ),
              CardColumn(alignmentEnd: true, header: MyStrings.charge, body: "")
            ],
          ),
          SizedBox(height: Dimensions.space15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CardColumn(
                header: MyStrings.remainingBalance,
                body: "",
              ),
            ],
          )
        ],
      ),
    );
  }
}
