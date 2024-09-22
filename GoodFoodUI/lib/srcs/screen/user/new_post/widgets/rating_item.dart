import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/color_scheme.dart';
import '../../../../models/restaurant_review/restaurant_review_model.dart';

class PostRatingItem extends StatefulWidget {
  const PostRatingItem({
    super.key,
    required this.flag,
    required this.title,
    required this.restaurantReview,
  });
  final int flag;
  final String title;
  final RestaurantReview restaurantReview;

  @override
  State<PostRatingItem> createState() => _PostRatingItemState();
}

class _PostRatingItemState extends State<PostRatingItem> {
  @override
  Widget build(BuildContext context) {
    void setRating(double value, int flag, WidgetRef ref) {
      switch (flag) {
        case 1:
          setState(() {
            widget.restaurantReview.hygiene = value;
          });
          break;
        case 2:
          setState(() {
            widget.restaurantReview.taste = value;
          });
          break;
        case 3:
          setState(() {
            widget.restaurantReview.space = value;
          });
          break;
        case 4:
          setState(() {
            widget.restaurantReview.price = value;
          });
          break;
        case 5:
          setState(() {
            widget.restaurantReview.service = value;
          });
          break;
        default:
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              widget.title,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Consumer(
            builder: (context, ref, child) => RatingBar(
              itemSize: 30,
              onRatingUpdate: (value) {
                setRating(value, widget.flag, ref);
              },
              initialRating: 0.0,
              allowHalfRating: true,
              ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star_rate_rounded,
                  color: userTints4,
                ),
                half: const Icon(
                  Icons.star_half_rounded,
                  color: userTints4,
                ),
                empty: const Icon(
                  Icons.star_border_rounded,
                  color: userTints4,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
