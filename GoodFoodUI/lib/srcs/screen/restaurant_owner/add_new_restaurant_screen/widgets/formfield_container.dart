import 'package:flutter/material.dart';

class FormFieldContainer extends StatelessWidget {
  final Widget child;
  const FormFieldContainer({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // padding: const EdgeInsets.symmetric(
      //   horizontal: 20,
      // ),

      child: child,
    );
  }
}
