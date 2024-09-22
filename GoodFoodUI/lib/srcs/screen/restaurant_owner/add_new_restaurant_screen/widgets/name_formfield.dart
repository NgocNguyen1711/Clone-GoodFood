import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/restaurant/restaurant_model.dart';
import '../../../../providers/restaurant_provider.dart';
import 'formfield_container.dart';

class NameFormField extends StatelessWidget {
  const NameFormField({
    required this.enable,
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return FormFieldContainer(
      child: Consumer(
        builder: (context, ref, child) {
          final state = ref.watch(updateRestaurantController(restaurant));
          final TextEditingController controller = TextEditingController(
            text: state.tenQuanAn,
          );
          controller.selection =
              TextSelection.collapsed(offset: controller.text.length);
          return TextFormField(
            enabled: enable,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: controller,
            onChanged: (newValue) {
              ref
                  .read(updateRestaurantController(restaurant).notifier)
                  .update(tenQuanAn: newValue);
            },
            onSaved: (newValue) {
              if (newValue != null) {
                ref
                    .read(updateRestaurantController(restaurant).notifier)
                    .update(tenQuanAn: newValue);
              }
            },
            style: const TextStyle(fontSize: 18),
            decoration: const InputDecoration(
              label: Text('Tên quán ăn'),
              // border: InputBorder.none,
              hintText: "Quán ăn GoodFood",
            ),
          );
        },
      ),
    );
  }
}
