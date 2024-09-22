import 'package:flutter/material.dart';

class PostOverviewIconBar extends StatelessWidget {
  const PostOverviewIconBar({
    required int like,
    required int comment,
    required int favorite,
    super.key,
  })  : _like = like,
        _comment = comment,
        _favorite = favorite;
  final int _like;
  final int _comment;
  final int _favorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: Row(
              children: [
                const Icon(
                  Icons.favorite_border_rounded,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  _like.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.chat_bubble_outline,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  _comment.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Icon(
                  Icons.bookmark_outline_rounded,
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  _favorite.toString(),
                  style: const TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
