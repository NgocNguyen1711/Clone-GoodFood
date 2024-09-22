import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/color_scheme.dart';
import '../../../../models/restaurant/restaurant_model.dart';
import '../../../../providers/restaurant_provider.dart';

class ImageSelectField extends StatelessWidget {
  const ImageSelectField({
    required this.restaurant,
    required this.enable,
    super.key,
  });

  final RestaurantModel restaurant;
  final bool enable;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      height: 250,
      child: Consumer(
        builder: (context, ref, child) {
          final imageRef = ref.watch(updateRestaurantController(restaurant));
          return Stack(
            children: [
              imageRef.hinhAnh.isNotEmpty
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.memory(
                        base64Decode(imageRef.hinhAnh),
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: commonLightGrey,
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.photo_camera_outlined,
                          size: 50,
                          weight: 1,
                        ),
                      ),
                    ),
              GestureDetector(
                onTap: enable
                    ? () async {
                        final XFile? file = await ImagePicker()
                            .pickImage(source: ImageSource.gallery);
                        if (file != null) {
                          ref
                              .read(updateRestaurantController(restaurant)
                                  .notifier)
                              .update(
                                  hinhAnh:
                                      base64Encode(await file.readAsBytes()),
                                  imagePath: file.path);
                        }
                      }
                    : null,
              ),
              if (imageRef.hinhAnh.isNotEmpty && enable)
                Positioned(
                  top: 0,
                  right: 0,
                  child: FloatingActionButton(
                    mini: true,
                    backgroundColor: commonLightGrey,
                    foregroundColor: Theme.of(context).colorScheme.error,
                    onPressed: () {
                      ref
                          .read(updateRestaurantController(restaurant).notifier)
                          .update(hinhAnh: "", imagePath: "");
                    },
                    child: const Icon(
                      Icons.highlight_remove_rounded,
                      size: 30,
                    ),
                  ),
                )
            ],
          );
        },
      ),
    );
  }
}
