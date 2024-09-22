import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/common/widgets/show_loading.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/models/user_bookmark/user_bookmark.dart';
import 'package:good_food/srcs/screen/user/post_detail/post_detail_screen.dart';
import 'package:good_food/srcs/screen/user/view_restaurant/view_restaurant.dart';
import 'package:good_food/srcs/services/bookmark_services.dart';

final bookMarkFutureProvider =
    FutureProvider((ref) => ref.watch(bookmarkProvider).getBookmark());

class BookMarkScreen extends ConsumerWidget {
  static const String route = 'bookmark';
  const BookMarkScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookmark = ref.watch(bookMarkFutureProvider);
    return SafeArea(
      child: DefaultTabController(
        initialIndex: 0,
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Danh sách yêu thích'),
            bottom: const TabBar(
              labelColor: commonDark,
              indicatorColor: userTints4,
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  text: 'Bài viết',
                ),
                Tab(
                  text: 'Quán ăn',
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              bookmark.when(
                data: (data) => ListView.builder(
                  shrinkWrap: true,
                  itemCount: data?.baiViet.length ?? 0,
                  itemBuilder: (context, index) => ListTile(
                    onLongPress: () {
                      buildDeletePostModal(context, data, index, true);
                    },
                    onTap: () {
                      Navigator.of(context).pushNamed(PostDetailScreen.route,
                          arguments: data?.baiViet[index].id);
                    },
                    leading: SizedBox(
                      width: 60,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '$baseUrl/Image/${data?.baiViet[index].idHinhAnhQuanAn}',
                        ),
                      ),
                    ),
                    subtitle: Text(
                      data?.baiViet[index].nhanXet ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                    title: Text(data?.baiViet[index].tieuDe ?? ''),
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              bookmark.when(
                data: (data) => ListView.builder(
                  itemCount: data?.quanAn.length ?? 0,
                  itemBuilder: (context, index) => ListTile(
                    onLongPress: () {
                      buildDeletePostModal(context, data, index, false);
                    },
                    onTap: () {
                      Navigator.of(context).pushNamed(
                        ViewRestaurantScreen.route,
                        arguments: data?.quanAn[index],
                      );
                    },
                    leading: SizedBox(
                      width: 60,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '$baseUrl/Image/${data?.quanAn[index].idHinhAnh}',
                        ),
                      ),
                    ),
                    title: Text(data?.quanAn[index].tenQuanAn ?? ''),
                    subtitle: Text(
                      data?.quanAn[index].diaChi ?? '',
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                error: (error, stackTrace) => Center(
                  child: Text(error.toString()),
                ),
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildDeletePostModal(
      BuildContext context, UserBookmarkModel? data, int index, bool isPost) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer(
              builder: (context, ref, child) => TextButton(
                onPressed: () async {
                  await showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text('Xác nhận xóa'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Đóng'),
                        ),
                        TextButton(
                          onPressed: () async {
                            showLoaderDialog(context);
                            if (isPost) {
                              await ref
                                  .read(bookmarkProvider)
                                  .deletePost(data!.baiViet[index].id);
                            } else {
                              await ref.read(bookmarkProvider).deleteRestaurant(
                                    data!.quanAn[index].idQuanAn,
                                  );
                            }
                            if (context.mounted) {
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                              return ref.refresh(bookMarkFutureProvider);
                            }
                          },
                          child: const Text('Xóa'),
                        )
                      ],
                    ),
                  );
                  if (context.mounted) {
                    Navigator.of(context).pop();
                  }
                },
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.resolveWith<Color>((states) {
                    if (states.contains(MaterialState.disabled)) {
                      return Colors.grey;
                    }
                    return Colors.red;
                  }),
                  minimumSize: const MaterialStatePropertyAll(
                    Size(double.infinity, 50),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      isPost ? 'Xoá bài viết đã lưu' : 'Xóa quán ăn đã lưu',
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
