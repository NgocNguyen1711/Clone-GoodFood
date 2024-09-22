import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UseCurrentLocation extends ConsumerWidget {
  const UseCurrentLocation({
    super.key,
    required this.context,
    required this.onPress,
  });

  final BuildContext context;
  final Function onPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        onPressed: () async {
          FocusManager.instance.primaryFocus?.unfocus();
          await onPress();
          // Navigator.of(context).pop(await onPress());
        },
        // icon: const Icon(Icons.send_rounded),
        child: const Text(
          "Sử dụng vị trí của tôi",
          style: TextStyle(
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
