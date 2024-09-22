import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_model.dart';
import 'package:good_food/srcs/providers/restaurant_provider.dart';

import 'widgets/image_select_field.dart';
import 'widgets/name_formfield.dart';
import 'widgets/phone_formfield.dart';
import 'widgets/select_location.dart';
import 'widgets/time_formfield.dart';
import 'widgets/type_select_field.dart';

class AddNewRestaurantScreen extends StatelessWidget {
  static const String route = "ro/add-new-restaurant/";
  final formKey = GlobalKey<FormState>();

  AddNewRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurantModel restaurant = RestaurantModel.empty();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(color: commonDark),
          title: const Text(
            "Thêm nhà hàng",
            style: TextStyle(color: commonDark),
          ),
          centerTitle: true,
          actions: [
            Consumer(
              builder: (context, ref, child) => TextButton(
                onPressed: () {
                  formKey.currentState!.save();
                  final state =
                      ref.watch(updateRestaurantController(restaurant));
                  ref.refresh(addRestaurantProvider(state).future).then(
                    (value) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Thêm quán ăn thành công'),
                        ),
                      );
                      Navigator.of(context).pop();
                    },
                  ).onError(
                    (error, stackTrace) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Thêm quán ăn không thành công'),
                        ),
                      );
                    },
                  );
                },
                child: const Text('Lưu'),
              ),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImageSelectField(
                  restaurant: restaurant,
                  enable: true,
                ),
                NameFormField(
                  restaurant: restaurant,
                  enable: true,
                ),
                SelectLocation(
                  restaurant: restaurant,
                  enable: true,
                ),
                TimeFormField(
                  restaurant: restaurant,
                  enable: true,
                ),
                PhoneFormField(
                  restaurant: restaurant,
                  enable: true,
                ),
                TypeSelectField(
                  restaurant: restaurant,
                  enable: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
