import 'dart:io';

import '../dish_review/dish_review.dart';

class RestaurantReview {
  int id = 0;
  File? image;
  String title = '';
  String review = '';
  double hygiene = 0.0;
  double taste = 0.0;
  double space = 0.0;
  double price = 0.0;
  double service = 0.0;
  List<DishReview> dishes = [];
  RestaurantReview();
}
