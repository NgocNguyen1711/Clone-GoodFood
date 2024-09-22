import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/restaurant_review/restaurant_review_model.dart';

class RestaurantReviewContent extends StatefulWidget {
  const RestaurantReviewContent({
    super.key,
    required this.restaurantReview,
  });

  final RestaurantReview restaurantReview;

  @override
  State<RestaurantReviewContent> createState() =>
      _RestaurantReviewContentState();
}

class _RestaurantReviewContentState extends State<RestaurantReviewContent> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: defaultPadding / 2,
      ),
      child: TextFormField(
        validator: (value) {
          return value == null || value.isEmpty
              ? 'Hãy thêm đánh giá cho quán ăn'
              : null;
        },
        onTapOutside: (event) {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        maxLines: null,
        decoration: const InputDecoration(
          hintText: 'Đánh giá về quán ăn',
        ),
        keyboardType: TextInputType.multiline,
        onSaved: (newValue) {
          setState(() {
            widget.restaurantReview.review = newValue ?? '';
          });
        },
      ),
    );
  }
}
