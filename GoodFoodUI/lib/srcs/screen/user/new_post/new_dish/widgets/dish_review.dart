import 'package:flutter/material.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../models/dish_review/dish_review.dart';

class DishReviewInputField extends StatefulWidget {
  const DishReviewInputField({
    super.key,
    required this.dishReview,
  });

  final DishReview dishReview;

  @override
  State<DishReviewInputField> createState() => _DishReviewInputFieldState();
}

class _DishReviewInputFieldState extends State<DishReviewInputField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Hãy thêm đánh giá cho món ăn';
          }
          return null;
        },
        initialValue: widget.dishReview.review,
        maxLines: null,
        decoration: const InputDecoration(
          hintText: 'Đánh giá về quán ăn',
          constraints: BoxConstraints(maxHeight: 200),
        ),
        keyboardType: TextInputType.multiline,
        onSaved: (newValue) {
          setState(() {
            widget.dishReview.review = newValue ?? '';
          });
        },
      ),
    );
  }
}
