import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/restaurant/restaurant_model.dart';

class RestaurantImage extends StatelessWidget {
  const RestaurantImage({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              insetPadding: const EdgeInsets.symmetric(horizontal: 0),
              child: InteractiveViewer(
                maxScale: 2.0,
                child: Image(
                  width: double.infinity,
                  fit: BoxFit.contain,
                  image: NetworkImage('$baseUrl/Image/${restaurant.idHinhAnh}'),
                ),
              ),
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(defaultPadding / 2),
          child: SizedBox(
            height: 250,
            width: double.infinity,
            child: Image(
              fit: BoxFit.fitWidth,
              image: NetworkImage(
                '$baseUrl/Image/${restaurant.idHinhAnh}',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
