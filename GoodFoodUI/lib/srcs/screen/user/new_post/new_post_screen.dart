import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/goodfood_button.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/services/post_services.dart';

import '../../../models/restaurant/restaurant_model.dart';
import '../../../models/restaurant_review/restaurant_review_model.dart';
import 'widgets/rating_item.dart';
import 'widgets/restaurant_content.dart';
import 'widgets/restaurant_dishes.dart';
import 'widgets/restaurant_image_picker.dart';
import 'widgets/restaurant_title.dart';

class NewPostScreen extends StatefulWidget {
  static const String route = 'new-post';
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final restaurantReview = RestaurantReview();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final restaurant =
        ModalRoute.of(context)!.settings.arguments as RestaurantModel;
    restaurantReview.id = restaurant.idQuanAn;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            restaurant.tenQuanAn,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) => Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    RestaurantImagePicker(restaurantReview: restaurantReview),
                    RestaurantReviewTitle(restaurantReview: restaurantReview),
                    RestaurantReviewContent(restaurantReview: restaurantReview),
                    PostRatingItem(
                      flag: 1,
                      title: 'Vệ sinh',
                      restaurantReview: restaurantReview,
                    ),
                    PostRatingItem(
                      flag: 2,
                      title: 'Hương vị',
                      restaurantReview: restaurantReview,
                    ),
                    PostRatingItem(
                      flag: 3,
                      title: 'Không gian',
                      restaurantReview: restaurantReview,
                    ),
                    PostRatingItem(
                      flag: 4,
                      title: 'Giá cả',
                      restaurantReview: restaurantReview,
                    ),
                    PostRatingItem(
                      flag: 5,
                      title: 'Phục vụ',
                      restaurantReview: restaurantReview,
                    ),
                    RestaurantReviewDishes(
                      restaurantReview: restaurantReview,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: defaultPadding / 2),
                      child: GoodfoodPrimaryButton(
                        onPressed: () async {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            await ref
                                .watch(postProvider)
                                .addNewPost(restaurantReview);
                          }
                        },
                        child: const Text('Đăng'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
