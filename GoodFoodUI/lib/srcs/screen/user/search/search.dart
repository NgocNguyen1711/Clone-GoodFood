import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/drawer.dart';
import 'package:good_food/srcs/core/app_assets.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/models/dish/dish_model.dart';
import 'package:good_food/srcs/models/post_overview/post_overview_model.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_model.dart';
import 'package:good_food/srcs/models/user/user_model.dart';
import 'package:good_food/srcs/screen/user/post_overview/widgets/post_overview_item.dart';
import 'package:good_food/srcs/screen/user/profile/user_profile.dart';
import 'package:good_food/srcs/screen/user/view_restaurant/view_restaurant.dart';
import 'package:good_food/srcs/services/search_services.dart';

import '../../../core/color_scheme.dart';

final searchPostFutureProvider =
    FutureProvider.family<List<PostOverviewModel>, String>(
  (ref, keyword) => ref.watch(searchServiceProvider).SearchPost(keyword),
);
final searchUserFutureProvider = FutureProvider.family<List<UserModel>, String>(
  (ref, keyword) => ref.watch(searchServiceProvider).SearchUser(keyword),
);
final searchRestaurantFutureProvider =
    FutureProvider.family<List<RestaurantModel>, String>(
  (ref, keyword) => ref.watch(searchServiceProvider).SearchRestaurant(keyword),
);
final searchDishFutureProvider = FutureProvider.family<List<DishModel>, String>(
  (ref, keyword) => ref.watch(searchServiceProvider).SearchDish(keyword),
);

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  int index = 0;
  final TextEditingController textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  void search(String keyword, int type) {
    if (type == 0) {
      setState(() {
        ref.read(searchPostFutureProvider(keyword));
      });
      return;
    }
    if (type == 1) {
      setState(() {
        ref.read(searchUserFutureProvider(keyword));
      });
      return;
    }
    if (type == 2) {
      setState(() {
        ref.read(searchRestaurantFutureProvider(keyword));
      });
      return;
    }
    if (type == 3) {
      setState(() {
        ref.read(searchDishFutureProvider(keyword));
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: index,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Search'),
        ),
        drawer: const GoodFoodUserDrawer(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(children: [
            TextField(
              controller: textEditingController,
              onSubmitted: (value) {
                if (value.isEmpty) {
                  return;
                }
                search(textEditingController.text, index);
              },
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Tìm kiếm...',
              ),
            ),
            TabBar(
              onTap: (value) {
                if (value == index) {
                  return;
                }
                setState(() {
                  index = value;
                });
                if (textEditingController.text.isEmpty) return;
                search(textEditingController.text, index);
              },
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: defaultPadding),
              labelColor: commonDark,
              indicatorColor: userTints4,
              labelStyle: const TextStyle(
                fontSize: 16,
              ),
              tabs: const [
                Tab(text: 'Bài viết'),
                Tab(text: 'Người dùng'),
                Tab(text: 'Quán ăn'),
                Tab(text: 'Món ăn'),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ref
                      .watch(
                          searchPostFutureProvider(textEditingController.text))
                      .when(
                        data: (data) => data.isEmpty
                            ? const Text('Không tìm thấy kết quả')
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  return PostOverviewItem(
                                      postOverviewModel: data[index]);
                                },
                              ),
                        error: (error, stackTrace) {
                          return Text(error.toString());
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ref
                      .watch(
                          searchUserFutureProvider(textEditingController.text))
                      .when(
                        data: (data) => data.isEmpty
                            ? const Text('Không tìm thấy kết quả')
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) => ListTile(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        UserProfileScreen.route,
                                        arguments: data[index].id);
                                  },
                                  leading: SizedBox(
                                    width: 50,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      image: data[index].idHinhAnh != 0 &&
                                              data[index].idHinhAnh != null
                                          ? NetworkImage(
                                                  '$baseUrl/Image/${data[index].idHinhAnh}')
                                              as ImageProvider
                                          : const AssetImage(tLogoDefault),
                                    ),
                                  ),
                                  title: Text(
                                    data[index].hoVaTen ??
                                        'user${data[index].id}',
                                  ),
                                ),
                              ),
                        error: (error, stackTrace) {
                          return Text(error.toString());
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ref
                      .watch(searchRestaurantFutureProvider(
                          textEditingController.text))
                      .when(
                        data: (data) => data.isEmpty
                            ? const Text('Không tìm thấy kết quả')
                            : ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) => ListTile(
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        ViewRestaurantScreen.route,
                                        arguments: data[index]);
                                  },
                                  leading: SizedBox(
                                    width: 50,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '$baseUrl/Image/${data[index].idHinhAnh}'),
                                    ),
                                  ),
                                  title: Text(data[index].tenQuanAn),
                                  subtitle: Text(data[index].diaChi),
                                ),
                              ),
                        error: (error, stackTrace) {
                          return Text(error.toString());
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                  ref
                      .watch(
                          searchDishFutureProvider(textEditingController.text))
                      .when(
                        data: (data) => data.isEmpty
                            ? const Text('Không tìm thấy kết quả')
                            : ListView.builder(
                                itemBuilder: (context, index) => ListTile(
                                  leading: SizedBox(
                                    width: 50,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                          '$baseUrl/Image/${data[index].idHinhAnh}'),
                                    ),
                                  ),
                                  title: Text(data[index].tenMon),
                                  subtitle:
                                      Text(data[index].giaTien.toString()),
                                ),
                                itemCount: data.length,
                              ),
                        error: (error, stackTrace) {
                          return Text(error.toString());
                        },
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
