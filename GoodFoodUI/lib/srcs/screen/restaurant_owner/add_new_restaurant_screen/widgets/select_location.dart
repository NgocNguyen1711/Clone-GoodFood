import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/google_location/location_model.dart';
import '../../../../models/restaurant/restaurant_model.dart';
import '../../../../providers/restaurant_provider.dart';
import '../location_screen/location_screen.dart';
import 'formfield_container.dart';

class SelectLocation extends StatelessWidget {
  const SelectLocation({
    super.key,
    required this.restaurant,
    required this.enable,
  });

  final RestaurantModel restaurant;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      child: Consumer(
        builder: (context, ref, child) {
          final restaurantRef =
              ref.watch(updateRestaurantController(restaurant));
          final TextEditingController controller = TextEditingController(
            text: restaurantRef.diaChi,
          );
          return GestureDetector(
            onTap: enable
                ? () async {
                    final location = await Navigator.of(context)
                        .pushNamed(LocationScreen.route);
                    if (location != null) {
                      ref
                          .read(updateRestaurantController(restaurant).notifier)
                          .update(locationModel: location as LocationModel);
                      controller.value =
                          controller.value.copyWith(text: restaurantRef.diaChi);
                    }
                  }
                : null,
            child: TextFormField(
              style: const TextStyle(fontSize: 18),
              controller: controller,
              decoration: const InputDecoration(
                label: Text("Địa chỉ"),
              ),
              enabled: false,
            ),
          );
        },
      ),
    );
  }
}
