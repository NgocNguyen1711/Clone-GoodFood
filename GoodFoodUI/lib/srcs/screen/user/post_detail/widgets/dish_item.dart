import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';
import '../../../../models/dish/dish_model.dart';
import '../../post_overview/widgets/post_overview_image.dart';

class DishItem extends StatelessWidget {
  const DishItem({
    super.key,
    required this.dish,
  });
  final DishModel dish;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    insetPadding: const EdgeInsets.symmetric(horizontal: 0),
                    child: InteractiveViewer(
                      maxScale: 2.0,
                      child: CachedNetworkImage(
                        imageUrl: '$baseUrl/Image/${dish.idHinhAnh}',
                        imageBuilder: (context, imageProvider) => Image(
                            width: double.infinity,
                            fit: BoxFit.contain,
                            image: imageProvider),
                        placeholder: (context, url) =>
                            const Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  );
                },
              );
            },
            child: Center(
              child: PostOverviewImage(
                imageUrl: '$baseUrl/Image/${dish.idHinhAnh}',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              textAlign: TextAlign.start,
              '${dish.giaTien} VND',
              style: const TextStyle(
                fontSize: 20,
                color: userTints1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              dish.tenMon,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(dish.nhanXet),
          ),
        ],
      ),
    );
  }
}
