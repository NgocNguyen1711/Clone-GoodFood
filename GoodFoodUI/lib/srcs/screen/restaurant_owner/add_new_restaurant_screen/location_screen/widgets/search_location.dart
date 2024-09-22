import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.context,
    required this.onChange,
    required this.controller,
    required this.hint,
    required this.iconData,
  });

  final BuildContext context;
  final Function onChange;
  final TextEditingController controller;
  final String hint;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: TextFormField(
          controller: controller,
          onChanged: (value) {
            onChange(value);
          },
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            prefixIcon: Icon(iconData),
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
