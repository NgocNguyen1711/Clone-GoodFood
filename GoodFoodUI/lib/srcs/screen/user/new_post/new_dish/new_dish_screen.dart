import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/goodfood_button.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';

import '../../../../core/app_constants.dart';
import '../../../../models/dish_review/dish_review.dart';
import 'widgets/dish_image_picker.dart';
import 'widgets/dish_review.dart';

class PostReviewModelState extends StateNotifier<DishModel> {
  PostReviewModelState()
      : super(
          const DishModel(
            id: 0,
            tenMon: "",
            giaTien: 0,
            idQuanAn: 0,
            idHinhAnh: 0,
            nhanXet: "",
            imagePath: "",
          ),
        );

  PostReviewModelState.init(super.state);

  void updateState({
    int? id,
    String? tenMon,
    int? giaTien,
    int? idQuanAn,
    int? idHinhAnh,
    String? nhanXet,
    String? imagePath,
  }) {
    state = state.copyWith(
      id: id ?? state.id,
      tenMon: tenMon ?? state.tenMon,
      giaTien: giaTien ?? state.giaTien,
      idQuanAn: idQuanAn ?? state.idQuanAn,
      nhanXet: nhanXet ?? state.nhanXet,
      imagePath: imagePath ?? state.imagePath,
    );
  }
}

final dishReviewModelStateProvider =
    StateNotifierProvider.family<PostReviewModelState, DishModel, DishModel>(
        (ref, dish) => PostReviewModelState.init(dish));

class NewDishReviewScreen extends StatelessWidget {
  static const String route = 'new-post/dish';
  NewDishReviewScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final dish = ModalRoute.of(context)!.settings.arguments as DishReview;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dish.name),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  DishImagePicker(dishReview: dish),
                  DishReviewInputField(dishReview: dish),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: GoodfoodPrimaryButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          Navigator.of(context).pop(dish);
                        }
                      },
                      child: const Text('Xong'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
