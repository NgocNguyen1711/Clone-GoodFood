import 'package:flutter/material.dart';

import '../../../../core/app_constants.dart';
import '../../../../core/color_scheme.dart';

class PasswordInputField extends StatefulWidget {
  const PasswordInputField({
    super.key,
    required this.label,
    required this.controllers,
    required this.controllerKey,
  });

  final Map<String, TextEditingController> controllers;
  final Widget label;
  final String controllerKey;

  @override
  State<PasswordInputField> createState() => _PasswordInputFieldState();
}

class _PasswordInputFieldState extends State<PasswordInputField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding / 2),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        controller: widget.controllers[widget.controllerKey],
        obscureText: isObscureText,
        validator: (value) {
          final passwordRegExp = RegExp(
              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
          if (value == null) {
            return 'Mật khẩu không được để trống';
          }
          if (widget.controllerKey == 'new') {
            if (!passwordRegExp.hasMatch(value)) {
              return 'Mật khẩu không hợp lệ';
            }
          }
          if (widget.controllerKey == 'new') {
            if (value == widget.controllers['current']?.text) {
              return 'Mật khẩu mới không được trùng với mật khẩu hiện tại';
            }
          }
          if (widget.controllerKey == 'duplicate') {
            if (value != widget.controllers['new']?.text) {
              return 'Nhập lại mật khẩu không trùng khớp';
            }
          }
          return null;
        },
        decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
            icon: Icon(
              isObscureText
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: commonDark.withOpacity(0.5),
            ),
          ),
          label: widget.label,
        ),
      ),
    );
  }
}
