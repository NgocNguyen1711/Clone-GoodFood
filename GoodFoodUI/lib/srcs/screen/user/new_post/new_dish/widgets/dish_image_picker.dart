import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/app_constants.dart';
import '../../../../../core/color_scheme.dart';
import '../../../../../models/dish_review/dish_review.dart';

class DishImagePicker extends StatefulWidget {
  const DishImagePicker({
    super.key,
    required this.dishReview,
  });

  final DishReview dishReview;

  @override
  State<DishImagePicker> createState() => _DishImagePickerState();
}

class _DishImagePickerState extends State<DishImagePicker> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: FormField<XFile>(
        initialValue: widget.dishReview.image != null
            ? XFile(widget.dishReview.image!.path)
            : null,
        validator: (value) {
          return value == null ? 'Hãy chọn hình ảnh thực tế cho món ăn' : null;
        },
        onSaved: (newValue) {
          if (newValue != null) {
            setState(() {
              widget.dishReview.image = File(newValue.path);
            });
          }
        },
        builder: (fieldState) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () async {
                final XFile? file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (file != null) {
                  fieldState.didChange(file);
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    color: commonLightGrey,
                  ),
                  child: fieldState.value != null
                      ? Image(
                          fit: BoxFit.cover,
                          image: FileImage(
                            File(fieldState.value!.path),
                          ),
                        )
                      : const Icon(
                          Icons.add_a_photo_outlined,
                          size: 60,
                        ),
                ),
              ),
            ),
            if (fieldState.hasError)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 8,
                ),
                child: Text(
                  fieldState.errorText!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
