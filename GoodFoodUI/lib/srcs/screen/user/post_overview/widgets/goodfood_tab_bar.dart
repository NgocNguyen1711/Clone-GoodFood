import 'package:flutter/material.dart';

import '/srcs/core/color_scheme.dart';

class GoodFoodTabBar extends StatelessWidget {
  const GoodFoodTabBar({
    super.key,
    required TabController tabController,
    required List<String> texts,
  })  : _tabController = tabController,
        _texts = texts;

  final TabController _tabController;
  final List<String> _texts;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      labelStyle: const TextStyle(
        color: commonDark,
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      labelColor: Colors.black,
      unselectedLabelStyle: const TextStyle(
        color: commonDark,
        fontSize: 18,
      ),
      indicatorColor: user2,
      indicatorSize: TabBarIndicatorSize.label,
      overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
      tabs: _texts
          .map((e) => Tab(
                text: e,
              ))
          .toList(),
      controller: _tabController,
    );
  }
}
