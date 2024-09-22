import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../providers/restaurant_provider.dart';
import '../add_new_restaurant_screen/widgets/image_select_field.dart';
import '../add_new_restaurant_screen/widgets/name_formfield.dart';
import '../add_new_restaurant_screen/widgets/phone_formfield.dart';
import '../add_new_restaurant_screen/widgets/select_location.dart';
import '../add_new_restaurant_screen/widgets/time_formfield.dart';
import '../add_new_restaurant_screen/widgets/type_select_field.dart';

class RestaurantDetailScreen extends StatelessWidget {
  static const route = "/restaurant-detail";
  const RestaurantDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantId = ModalRoute.of(context)!.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Thông tin quán ăn',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        body: Consumer(
          builder: (context, ref, child) {
            final restaurant =
                ref.watch(getRestaurantByIdProvider(restaurantId));
            return restaurant.when(
              data: (data) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ImageSelectField(
                        restaurant: data,
                        enable: false,
                      ),
                      NameFormField(
                        restaurant: data,
                        enable: false,
                      ),
                      SelectLocation(
                        restaurant: data,
                        enable: false,
                      ),
                      TimeFormField(
                        restaurant: data,
                        enable: false,
                      ),
                      PhoneFormField(
                        restaurant: data,
                        enable: false,
                      ),
                      TypeSelectField(
                        restaurant: data,
                        enable: false,
                      ),
                    ],
                  ),
                );
              },
              error: (e, s) => Center(
                child: Text(e.toString()),
              ),
              loading: () => const SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
