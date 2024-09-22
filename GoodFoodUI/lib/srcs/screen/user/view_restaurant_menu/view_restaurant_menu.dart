import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_assets.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';

import '../../../services/dish_services.dart';

final menuFutureProvider = FutureProvider.family<List<DishModel>, int>(
  (ref, restaurantId) => DishServices().getDishByRestaurantId(restaurantId),
);

class ViewRestaurantMenuScreen extends StatelessWidget {
  static const String route = 'post-detail/restaurant/menu';
  const ViewRestaurantMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurantId = ModalRoute.of(context)?.settings.arguments as int;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Thực đơn'),
        ),
        body: FutureBuilder(
          future: DishServices().getDishByRestaurantId(restaurantId),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                final menu = snapshot.data!;
                return ListView.builder(
                  itemCount: menu.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Image(
                      image: menu[index].idHinhAnh != 0
                          ? NetworkImage(
                                  '$baseUrl/Image/${menu[index].idHinhAnh}')
                              as ImageProvider
                          : const AssetImage(tLogoDefault),
                    ),
                    title: Text(menu[index].tenMon),
                    subtitle: Text(
                      menu[index].giaTien.toString(),
                    ),
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
