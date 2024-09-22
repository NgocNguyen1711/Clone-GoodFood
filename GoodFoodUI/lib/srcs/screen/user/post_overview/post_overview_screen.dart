import 'package:flutter/material.dart';
import 'package:good_food/srcs/common/widgets/drawer.dart';

import 'widgets/goodfood_tab_bar.dart';
import 'widgets/post_overview_list.dart';

class PostOverviewScreen extends StatefulWidget {
  static String route = '/post-overview';
  const PostOverviewScreen({super.key});

  @override
  State<PostOverviewScreen> createState() => _PostOverviewScreenState();
}

class _PostOverviewScreenState extends State<PostOverviewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const GoodFoodUserDrawer(),
      appBar: AppBar(
        title: GoodFoodTabBar(
          tabController: _tabController,
          texts: const ['Đang theo dõi', 'Khám phá'],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          PostOverviewList(
            key: PageStorageKey('follow'),
          ),
          PostOverviewList(
            key: PageStorageKey('explore'),
          ),
        ],
      ),
    );
  }
}
