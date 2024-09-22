import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/providers/restaurant_provider.dart';

import '../../../../models/restaurant/restaurant_model.dart';
import 'formfield_container.dart';

class SelectTimeField extends StatelessWidget {
  const SelectTimeField({
    super.key,
    required this.restaurant,
    required this.isOpen,
    required this.enable,
  });

  final bool isOpen;
  final RestaurantModel restaurant;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Consumer(
        builder: (context, ref, child) {
          final restaurantRef =
              ref.watch(updateRestaurantController(restaurant));
          final TextEditingController controller = TextEditingController(
            text: isOpen ? restaurantRef.gioMoCua : restaurantRef.gioDongCua,
          );
          return GestureDetector(
            onTap: enable
                ? () async {
                    TimeOfDay? selectedTime = await showTimePicker(
                      cancelText: "Đóng",
                      confirmText: "Lưu",
                      initialTime: TimeOfDay.now(),
                      context: context,
                    );
                    if (selectedTime != null) {
                      final updateRef = ref.watch(
                          updateRestaurantController(restaurant).notifier);
                      final String stringTime =
                          '${selectedTime.hour.toString()}:${selectedTime.minute < 10 ? '0${selectedTime.minute.toString()}' : selectedTime.minute.toString()}';
                      isOpen
                          ? updateRef.update(gioMoCua: stringTime)
                          : updateRef.update(gioDongCua: stringTime);
                      controller.value =
                          controller.value.copyWith(text: stringTime);
                    }
                  }
                : null,
            child: FormFieldContainer(
              child: TextFormField(
                style: const TextStyle(fontSize: 18),
                controller: controller,
                enabled: false,
                decoration: InputDecoration(
                  label: Text(isOpen ? "Giờ mở cửa" : "Giờ đóng cửa"),
                  hintText: isOpen ? "7:00" : '23:00',
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
