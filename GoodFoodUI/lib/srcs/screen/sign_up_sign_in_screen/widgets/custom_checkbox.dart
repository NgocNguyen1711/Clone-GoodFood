// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../../../core/color_scheme.dart';

// class CustomCheckbox extends ConsumerWidget {
//   final String text;
//   const CustomCheckbox(this.text, {super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Theme(
//       data: Theme.of(context).copyWith(
//         unselectedWidgetColor: userTints4,
//       ),
//       child: Container(
//         padding: const EdgeInsets.only(top: 10),
//         child: CheckboxListTile(
//             visualDensity: VisualDensity.compact,
//             title: Text(
//               text,
//               style: const TextStyle(
//                 fontSize: 16,
//                 fontFamily: 'OpenSans',
//                 fontWeight: FontWeight.w500,
//               ),
//             ),
//             controlAffinity: ListTileControlAffinity.leading,
//             activeColor: userTints4,
//             value: ref.watch(isRestaurantOwner),
//             onChanged: (value) =>
//                 ref.read(isRestaurantOwner.notifier).state = value!),
//       ),
//     );
//   }
// }
