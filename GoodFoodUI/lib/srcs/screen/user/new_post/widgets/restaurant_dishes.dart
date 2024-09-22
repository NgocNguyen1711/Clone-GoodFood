import 'package:flutter/material.dart';

import '../../../../common/widgets/goodfood_button.dart';
import '../../../../core/app_constants.dart';
import '../../../../models/dish_review/dish_review.dart';
import '../../../../models/restaurant_review/restaurant_review_model.dart';
import '../new_dish/select_dish_screen.dart';
import 'dish_review_item.dart';

class RestaurantReviewDishes extends StatefulWidget {
  const RestaurantReviewDishes({
    super.key,
    required this.restaurantReview,
  });

  final RestaurantReview restaurantReview;

  @override
  State<RestaurantReviewDishes> createState() => _RestaurantReviewDishesState();
}

class _RestaurantReviewDishesState extends State<RestaurantReviewDishes> {
  @override
  Widget build(BuildContext context) {
    return FormField<List<DishReview>>(
      validator: (value) {
        return value == null || value.isEmpty
            ? 'Hãy chọn món ăn để đánh giá'
            : null;
      },
      onSaved: (newValue) {},
      builder: (field) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (field.hasError)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 8,
              ),
              child: Text(
                field.errorText!,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                  fontSize: 12,
                ),
              ),
            ),
          ListView.builder(
            primary: false,
            shrinkWrap: true,
            itemCount: widget.restaurantReview.dishes.length,
            itemBuilder: (context, index) => DishReviewItem(
              fieldState: field,
              restaurantReview: widget.restaurantReview,
              index: index,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
            child: GoodfoodSecondaryButton(
              onPressed: () async {
                final dish = await Navigator.of(context).pushNamed(
                  SelectDishScreen.route,
                  arguments: {
                    'index': widget.restaurantReview.id,
                    'restaurantReview': widget.restaurantReview,
                  },
                );
                if (dish != null) {
                  widget.restaurantReview.dishes.add(dish as DishReview);
                  field.didChange(widget.restaurantReview.dishes);
                }
              },
              child: const Text('Thêm món ăn'),
            ),
          ),
        ],
      ),
    );
  }
}
