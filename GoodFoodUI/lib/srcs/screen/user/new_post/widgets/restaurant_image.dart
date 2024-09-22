// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:image_picker/image_picker.dart';

// import '../../../../core/color_scheme.dart';
// import '../../../../providers/post_review_provider.dart';

// class RestaurantImagePicker extends StatelessWidget {
//   const RestaurantImagePicker({
//     super.key,
//     required this.ref,
//   });
//   final WidgetRef ref;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5),
//       child: GestureDetector(
//         onTap: () async {
//           final XFile? file =
//               await ImagePicker().pickImage(source: ImageSource.gallery);
//           if (file != null) {
//             ref
//                 .read(postReviewModelStateProvider.notifier)
//                 .updateState(imagePath: file.path);
//           }
//         },
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(10),
//           child: Container(
//             decoration: const BoxDecoration(
//               color: commonLightGrey,
//             ),
//             height: 250,
//             width: double.infinity,
//             child: ref.watch(postReviewModelStateProvider).imagePath.isEmpty
//                 ? const Center(
//                     child: Icon(
//                       Icons.photo_camera_outlined,
//                       size: 50,
//                       weight: 1,
//                     ),
//                   )
//                 : Stack(
//                     children: [
//                       Image.file(
//                         File(ref.watch(postReviewModelStateProvider).imagePath),
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                       ),
//                       Positioned(
//                         top: 0,
//                         right: 0,
//                         child: FloatingActionButton(
//                           mini: true,
//                           backgroundColor: commonLightGrey,
//                           foregroundColor: Theme.of(context).colorScheme.error,
//                           onPressed: () {
//                             ref
//                                 .read(postReviewModelStateProvider.notifier)
//                                 .updateState(imagePath: "");
//                           },
//                           child: const Icon(
//                             Icons.highlight_remove_rounded,
//                             size: 30,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
