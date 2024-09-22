import 'package:flutter/material.dart';
import 'package:good_food/srcs/screen/user/new_post/new_post_screen.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/restaurant/restaurant_model.dart';

class RestaurantItem extends StatelessWidget {
  const RestaurantItem({
    super.key,
    required this.restaurant,
  });

  final RestaurantModel restaurant;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          Navigator.of(context).pushNamed(
            NewPostScreen.route,
            arguments: restaurant,
          );
        },
        title: Text(restaurant.tenQuanAn),
        subtitle: Text(restaurant.diaChi),
        trailing: restaurant.chatLuong.isNotEmpty
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(restaurant.chatLuong),
                  const Icon(
                    Icons.star_rate_rounded,
                    color: userTints4,
                  )
                ],
              )
            : null,
      ),
    );
  }
}
