import 'dart:io';

import 'package:flutter/material.dart';
import 'package:good_food/srcs/models/dish_review/dish_review.dart';

import '../../../../core/app_assets.dart';
import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/restaurant_review/restaurant_review_model.dart';
import '../new_dish/new_dish_screen.dart';

class DishReviewItem extends StatelessWidget {
  const DishReviewItem({
    super.key,
    required this.index,
    required this.restaurantReview,
    required this.fieldState,
  });
  final int index;
  final RestaurantReview restaurantReview;
  final FormFieldState fieldState;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
          decoration: BoxDecoration(
            border: Border.all(color: userTints4),
            borderRadius: BorderRadius.circular(defaultPadding / 2),
          ),
          child: ListTile(
            onTap: () async {
              final dish = await Navigator.of(context).pushNamed(
                NewDishReviewScreen.route,
                arguments: restaurantReview.dishes[index],
              );
              if (context.mounted && dish != null) {
                restaurantReview.dishes[index] = dish as DishReview;
                fieldState.didChange(restaurantReview.dishes);
              }
            },
            title: Text(
              restaurantReview.dishes[index].name,
            ),
            leading: Image(
              image: restaurantReview.dishes[index].image != null
                  ? FileImage(
                      File(restaurantReview.dishes[index].image!.path),
                    ) as ImageProvider
                  : const AssetImage(tLogoDefault),
            ),
            subtitle: Text(
              restaurantReview.dishes[index].review,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Positioned(
          right: -5,
          top: 0,
          child: IconButton(
            onPressed: () {
              buildDeleteDishItem(context);
            },
            icon: Icon(
              Icons.highlight_remove,
              color: Theme.of(context).colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }

  Future<dynamic> buildDeleteDishItem(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Xác nhận xóa'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Đóng'),
                      ),
                      TextButton(
                        onPressed: () {
                          restaurantReview.dishes.removeAt(index);
                          fieldState.didChange(restaurantReview.dishes);
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: const Text('Xoá'),
                      ),
                    ],
                  ),
                );
              },
              child: SizedBox(
                width: double.infinity,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Row(
                    children: const [
                      Text(
                        'Xóa món ăn',
                        style: TextStyle(color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
