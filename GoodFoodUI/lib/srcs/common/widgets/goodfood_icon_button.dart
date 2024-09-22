import 'package:flutter/material.dart';

class GoodFoodIconButton extends StatefulWidget {
  const GoodFoodIconButton({
    super.key,
    required this.onTap,
    required this.activeColor,
    required this.inactiveColor,
    required this.icon,
  });
  final Function onTap;
  final Color activeColor;
  final Color inactiveColor;
  final IconData icon;

  @override
  State<GoodFoodIconButton> createState() => _GoodFoodIconButtonState();
}

class _GoodFoodIconButtonState extends State<GoodFoodIconButton> {
  bool isTap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      child: IconButton(
        onPressed: () {
          widget.onTap();
          setState(() {
            isTap = !isTap;
          });
        },
        icon: Icon(
          widget.icon,
          size: 32,
          color: isTap ? widget.activeColor : widget.inactiveColor,
        ),
      ),
    );
  }
}
