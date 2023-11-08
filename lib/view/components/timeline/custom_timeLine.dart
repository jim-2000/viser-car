// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

import 'package:customer/core/utils/my_color.dart';
import 'package:customer/core/utils/my_icons.dart';

import 'package:customer/view/components/image/custom_svg_picture.dart';

class CustomTimeLine extends StatelessWidget {
  Widget firstWidget;
  Widget secondWidget;
  bool? needScrolling;
  CustomTimeLine({
    super.key,
    required this.firstWidget,
    required this.secondWidget,
    this.needScrolling = false,
  });

  @override
  Widget build(BuildContext context) {
    return Timeline.tileBuilder(
      theme: TimelineThemeData(
        nodePosition: 0,
        indicatorTheme: const IndicatorThemeData(size: 15.0, color: MyColor.colorYellow),
        indicatorPosition: 0.40,
        nodeItemOverlap: true,
      ),
      // padding: const EdgeInsets.symmetric(vertical: 20.0),
      physics: needScrolling! ? const PageScrollPhysics() : const NeverScrollableScrollPhysics(),
      builder: TimelineTileBuilder.connected(
        contentsBuilder: (context, index) => index == 0 ? firstWidget : secondWidget,
        connectorBuilder: (_, index, __) {
          return const DashedLineConnector(
            color: MyColor.colorYellow,
            thickness: .5,
          );
        },
        indicatorBuilder: (_, index) {
          return index == 0
              ? const CustomSvgPicture(
                  image: MyIcons.mapRed,
                  color: MyColor.colorRed,
                  height: 24,
                  width: 24,
                )
              : const CustomSvgPicture(
                  image: MyIcons.mapYellow,
                  color: MyColor.colorYellow,
                  height: 24,
                  width: 24,
                );
        },
        itemExtentBuilder: (_, __) => 60,
        itemCount: 2,
      ),
    );
  }
}
