import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/color_scheme.dart';

import '../../../../../models/google_location/location_model.dart';

class PredictionLocationTile extends StatelessWidget {
  const PredictionLocationTile({
    super.key,
    required this.data,
    required this.index,
  });

  final List<LocationModel> data;
  final int index;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        Navigator.of(context).pop(data[index]);
      },
      leading: const Icon(
        Icons.location_pin,
        color: userTints1,
      ),
      title: Text(
        data[index].description,
      ),
    );
  }
}
