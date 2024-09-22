// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
// import 'package:good_food/srcs/core/color_scheme.dart';
// import 'package:good_food/srcs/controllers/onboarding_controller.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// class OnBoardingScreen extends StatelessWidget {
//   const OnBoardingScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final obController = OnboardingController();

//     return Scaffold(
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           LiquidSwipe(
//             pages: obController.pages,
//             liquidController: obController.controller,
//             onPageChangeCallback: obController.onPageChangeCallback,
//           ),
//           Obx(
//             () => Positioned(
//               bottom: 120,
//               child: AnimatedSmoothIndicator(
//                 activeIndex: obController.currentPage.value,
//                 count: 3,
//                 effect: const WormEffect(
//                   activeDotColor: user1,
//                   dotHeight: 5.0,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
