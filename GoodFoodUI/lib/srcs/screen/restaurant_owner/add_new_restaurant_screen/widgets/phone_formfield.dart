import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/restaurant/restaurant_model.dart';
import '../../../../providers/restaurant_provider.dart';
import 'formfield_container.dart';

class PhoneFormField extends StatelessWidget {
  const PhoneFormField({
    required this.restaurant,
    required this.enable,
    super.key,
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
            text: restaurantRef.soDienThoai,
          );
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);
          return TextFormField(
            enabled: enable,
            controller: controller,
            keyboardType: TextInputType.number,
            onChanged: (value) {
              ref
                  .read(updateRestaurantController(restaurant).notifier)
                  .update(soDienThoai: value);
            },
            onSaved: (newValue) {
              if (newValue != null) {
                ref
                    .read(updateRestaurantController(restaurant).notifier)
                    .update(soDienThoai: newValue);
              }
            },
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              label: Text("Số điện thoại"),
              // border: InputBorder.none,
              hintText: "0123456789",
            ),
          );
        },
      ),
    );
  }
}
