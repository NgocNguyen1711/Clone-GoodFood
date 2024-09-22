import 'package:flutter/material.dart';
import 'package:good_food/srcs/core/color_scheme.dart';

class PostActionButton extends StatelessWidget {
  const PostActionButton({
    required this.color,
    required this.icon,
    required this.label,
    required this.onTap,
    super.key,
  });
  final Color color;
  final Text label;
  final Icon icon;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ButtonStyle(
          textStyle: const MaterialStatePropertyAll(TextStyle(fontSize: 16)),
          overlayColor: MaterialStatePropertyAll(Colors.grey[200]),
          shape: const MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
          ),
          elevation: const MaterialStatePropertyAll(0),
          minimumSize:
              const MaterialStatePropertyAll(Size(double.infinity, 50)),
          backgroundColor: MaterialStatePropertyAll(color),
          foregroundColor: const MaterialStatePropertyAll(commonDark)),
      onPressed: () {
        onTap();
      },
      label: label,
      icon: icon,
    );
  }
}
