// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:good_food/srcs/core/app_assets.dart';
// import 'package:good_food/srcs/models/model_onboarding.dart';
// import 'package:good_food/srcs/screen/user/onboarding_screen/widget/onboardingpage_widget.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';

// class OnboardingController extends GetxController {
//   final controller = LiquidController();

//   RxInt currentPage = 0.obs;

//   final pages = [
//     OnBoardingPage(
//       model: OnboardingModel(
//         image: tOnboarding1,
//         content: 'Đăng tải và chia sẻ trải nghiệm',
//         counterText: "1/3",
//         bgColor: const Color.fromRGBO(255, 250, 237, 1),
//       ),
//     ),
//     OnBoardingPage(
//       model: OnboardingModel(
//         image: tOnboarding2,
//         content: 'Lưu lại các bài viết và nhà hàng muốn đến',
//         counterText: "2/3",
//         bgColor: const Color.fromRGBO(255, 246, 221, 1.0),
//       ),
//     ),
//     OnBoardingPage(
//       model: OnboardingModel(
//         image: tOnboarding3,
//         content: 'Khám phá các địa điểm ăn uống mới',
//         counterText: "3/3",
//         bgColor: const Color.fromRGBO(255, 242, 208, 1.0),
//       ),
//     ),
//   ];

//   onPageChangeCallback(int activePageIndex) {
//     currentPage.value = activePageIndex;
//   }
// }
