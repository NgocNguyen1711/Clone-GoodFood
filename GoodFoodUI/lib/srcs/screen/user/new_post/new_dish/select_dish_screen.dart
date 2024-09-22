import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';
import 'package:good_food/srcs/models/dish_review/dish_review.dart';
import 'package:good_food/srcs/screen/user/new_post/new_dish/new_dish_screen.dart';
import 'package:good_food/srcs/services/dish_services.dart';

import '../../../../models/restaurant_review/restaurant_review_model.dart';

final listProvider = FutureProvider.family<List<DishModel>, int>(
    (ref, restaurantId) => DishServices().getDishByRestaurantId(restaurantId));

class SelectDishScreen extends StatelessWidget {
  static const String route = 'new-post/select-dish';
  const SelectDishScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final arg =
        ModalRoute.of(context)!.settings.arguments as Map<String, Object>;
    final restaurantId = arg['index'] as int;
    final restaurantReview = arg['restaurantReview'] as RestaurantReview;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: const Text("Chọn món ăn")),
        body: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, child) {
              return FutureBuilder(
                future: ref.watch(listProvider(restaurantId).future),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      final menu = snapshot.data!
                          .where((element) => !restaurantReview.dishes
                              .map((e) => e.id)
                              .contains(element.id))
                          .toList();
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: SingleChildScrollView(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: menu.length,
                            primary: false,
                            itemBuilder: (c, i) => Card(
                              child: ListTile(
                                onTap: () async {
                                  final DishReview dishReview = DishReview.init(
                                    id: menu[i].idQuanAn,
                                    name: menu[i].tenMon,
                                  );
                                  final dish =
                                      await Navigator.of(context).pushNamed(
                                    NewDishReviewScreen.route,
                                    arguments: dishReview,
                                  );
                                  if (context.mounted) {
                                    Navigator.of(context).pop(dish);
                                  }
                                },
                                title: Text(menu[i].tenMon),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
