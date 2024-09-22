import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/screen/restaurant_owner/restaurant_detail_screen/restaurant_detail_screen.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/restaurant/restaurant_model.dart';

class RestaurantOverviewItem extends StatelessWidget {
  const RestaurantOverviewItem({
    required this.restaurant,
    super.key,
  });

  final RestaurantModel restaurant;
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return ListTile(
          key: key,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image(
              fit: BoxFit.fitWidth,
              filterQuality: FilterQuality.medium,
              image: NetworkImage('$baseUrl/Image/${restaurant.idHinhAnh}'),
            ),
          ),
          title: Text(
            restaurant.tenQuanAn,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            restaurant.chatLuong.isEmpty
                ? "Chưa có đánh giá"
                : restaurant.chatLuong,
          ),
          onTap: () {
            Navigator.of(context).pushNamed(
              RestaurantDetailScreen.route,
              arguments: restaurant.idQuanAn,
            );
          },
        );
      },
    );
  }
}
