import 'package:flutter/material.dart';

import '../../../../../../../srcs/core/color_scheme.dart';
import '../../../../../models/google_location/location_model.dart';
import 'prediction_location_tile.dart';

class PredictionLocationList extends StatelessWidget {
  final List<LocationModel> data;
  const PredictionLocationList({
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              border: Border.all(
                color: commonDark,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: PredictionLocationTile(data: data, index: index),
          );
        },
        itemCount: data.length,
      ),
    );
  }
}
