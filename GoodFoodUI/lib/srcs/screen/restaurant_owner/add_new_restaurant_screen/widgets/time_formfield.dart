import 'package:flutter/material.dart';

import '../../../../models/restaurant/restaurant_model.dart';
import 'select_time_field.dart';

class TimeFormField extends StatelessWidget {
  const TimeFormField({
    super.key,
    required this.restaurant,
    required this.enable,
  });

  final RestaurantModel restaurant;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SelectTimeField(
          isOpen: true,
          restaurant: restaurant,
          enable: enable,
        ),
        SelectTimeField(
          isOpen: false,
          enable: enable,
          restaurant: restaurant,
        ),
      ],
    );
  }
}
