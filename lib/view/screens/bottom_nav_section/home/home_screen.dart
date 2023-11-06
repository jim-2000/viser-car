// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:customer/core/utils/dimensions.dart';
// import 'package:customer/core/utils/my_color.dart';
// import 'package:customer/data/controller/home/home_controller.dart';
// import 'package:customer/data/repo/home/home_repo.dart';
// import 'package:customer/data/services/api_service.dart';
// import 'package:customer/view/components/custom_loader/custom_loader.dart';
// import 'package:customer/view/components/will_pop_widget.dart';
// import 'package:customer/view/screens/bottom_nav_section/home/widget/main_item_section.dart';
// import 'package:customer/view/screens/bottom_nav_section/home/widget/top_section.dart';

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     Get.put(ApiClient(sharedPreferences: Get.find()));
//     Get.put(HomeRepo(apiClient: Get.find()));
//     final controller = Get.put(HomeController(homeRepo: Get.find()));
//     controller.isLoading = true;
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       controller.initialData();
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<HomeController>(
//       builder: (controller) => WillPopWidget(
//         nextRoute: "",
//         child: SafeArea(
//           child: RefreshIndicator(
//             onRefresh: () async {
//               await controller.initialData(shouldLoad: false);
//             },
//             child: Scaffold(
//               backgroundColor: MyColor.getScreenBgColor(),
//               body: controller.isLoading
//                   ? const CustomLoader()
//                   : const SingleChildScrollView(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TopSection(),
//                           SizedBox(height: Dimensions.space10),
//                           MainItemSection(),
//                         ],
//                       ),
//                     ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
