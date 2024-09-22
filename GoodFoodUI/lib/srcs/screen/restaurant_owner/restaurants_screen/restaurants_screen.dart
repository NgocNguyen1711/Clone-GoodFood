import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/restaurant_provider.dart';
import '../add_new_restaurant_screen/add_new_restaurant_screen.dart';
import 'widgets/restaurant_overview_item.dart';

class RestaurantsScreen extends StatelessWidget {
  const RestaurantsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Consumer(
        builder: (context, ref, child) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Quán ăn của tôi"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamed(AddNewRestaurantScreen.route);
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
            body: Consumer(
              builder: (context, ref, child) {
                final restaurantsRef =
                    ref.watch(getRestaurantByUserIdProvider(1));
                return RefreshIndicator(
                  onRefresh: () =>
                      ref.refresh(getRestaurantByUserIdProvider(1).future),
                  child: SizedBox.expand(
                    child: restaurantsRef.when(
                      data: (data) => ListView.builder(
                        // shrinkWrap: true,
                        itemBuilder: (buildContext, index) =>
                            RestaurantOverviewItem(
                          restaurant: data[index],
                        ),
                        itemCount: data.length,
                      ),
                      error: (e, s) => const Center(
                        child: Text('Error'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
