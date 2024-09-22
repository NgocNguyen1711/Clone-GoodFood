import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_model.dart';
import 'package:good_food/srcs/screen/restaurant_owner/add_new_restaurant_screen/location_screen/widgets/search_location.dart';
import 'package:good_food/srcs/services/restaurant_services.dart';

import 'widgets/reataurant_item.dart';

class ListRestaurant extends StateNotifier<List<RestaurantModel>> {
  ListRestaurant() : super([]);

  Future<List<RestaurantModel>> searchRestaurant(String searchString) async {
    state = await RestaurantServices().searchRestaurant(searchString);
    return state;
  }
}

final listRestaurantNotifier =
    StateNotifierProvider<ListRestaurant, List<RestaurantModel>>(
        (ref) => ListRestaurant());

class SelectRestaurant extends StatelessWidget {
  static const String route = 'new-post/restaurant';
  const SelectRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chọn nhà hàng'),
      ),
      body: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, child) {
            final result = ref.watch(listRestaurantNotifier);
            return Column(
              children: [
                SearchField(
                  iconData: Icons.restaurant,
                  hint: "Tìm kiếm quán ăn",
                  context: context,
                  onChange: (value) {
                    if (value != null) {
                      ref
                          .watch(listRestaurantNotifier.notifier)
                          .searchRestaurant(value);
                    }
                  },
                  controller: controller,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: result.length,
                  itemBuilder: (c, i) => RestaurantItem(
                    restaurant: result[i],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
