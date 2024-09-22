import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/color_scheme.dart';
import '../../../services/validate_services.dart';

final passwordVisibleProvider = StateProvider.autoDispose<bool>((ref) => false);

class CustomTextFormField extends ConsumerWidget {
  final String labelValue;
  final bool isEmail;
  final bool isPassword;
  final bool isConfirmPassword;
  final TextEditingController controller;

  const CustomTextFormField({
    super.key,
    required this.labelValue,
    this.isEmail = false,
    this.isPassword = false,
    this.isConfirmPassword = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final validateServicesRef = ValidateServices();
    final passwordVisibleRef = ref.read(passwordVisibleProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: TextFormField(
        style: const TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        controller: controller,
        validator: isEmail
            ? validateServicesRef.isValidEmail
            : (isConfirmPassword
                ? validateServicesRef.isValidConfirmPassword(ref)
                : validateServicesRef.isValidPassword),
        obscureText: (!ref.watch(passwordVisibleProvider) && isPassword),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(12),
          labelText: labelValue,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          filled: true,
          suffixIcon: isPassword
              ? IconButton(
                  icon: Icon(
                    ref.watch(passwordVisibleProvider)
                        ? Icons.visibility
                        : Icons.visibility_off,
                    color: user3,
                  ),
                  onPressed: () {
                    passwordVisibleRef.state = !passwordVisibleRef.state;
                  },
                )
              : null,
        ),
      ),
    );
  }
}
