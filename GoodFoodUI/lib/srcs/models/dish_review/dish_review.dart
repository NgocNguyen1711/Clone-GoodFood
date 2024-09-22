import 'dart:io';

class DishReview {
  int id = 0;
  String name = '';
  String review = '';
  File? image;

  DishReview();
  DishReview.init({
    required this.id,
    required this.name,
  });
}
