import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/app_constants.dart';

import '../../../../models/restaurant_review/restaurant_review_model.dart';

class RestaurantReviewTitle extends StatefulWidget {
  const RestaurantReviewTitle({
    super.key,
    required this.restaurantReview,
  });

  final RestaurantReview restaurantReview;

  @override
  State<RestaurantReviewTitle> createState() => _RestaurantReviewTitleState();
}

class _RestaurantReviewTitleState extends State<RestaurantReviewTitle> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: TextFormField(
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        validator: (value) {
          return value == null || value.isEmpty
              ? 'Hãy thêm tiêu đề cho bài đánh giá'
              : null;
        },
        decoration: const InputDecoration(hintText: 'Tiêu đề bài viết'),
        onSaved: (newValue) {
          setState(() {
            widget.restaurantReview.title = newValue ?? '';
          });
        },
      ),
    );
  }
}
