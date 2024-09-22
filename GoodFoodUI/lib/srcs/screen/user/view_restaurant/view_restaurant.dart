import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/app_constants.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/models/restaurant/restaurant_model.dart';
import 'package:good_food/srcs/screen/user/view_restaurant_menu/view_restaurant_menu.dart';
import 'package:good_food/srcs/services/bookmark_services.dart';

import 'widgets/restaurant_image.dart';

class ViewRestaurantScreen extends StatelessWidget {
  static const String route = 'post-detail/restaurant';
  const ViewRestaurantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final restaurant =
        ModalRoute.of(context)?.settings.arguments as RestaurantModel;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Quán ăn'),
          actions: [
            Consumer(
              builder: (context, ref, child) => PopupMenuButton(
                onSelected: (value) async {
                  if (value == 0) {
                    Navigator.of(context).pushNamed(
                      ViewRestaurantMenuScreen.route,
                      arguments: restaurant.idQuanAn,
                    );
                  }
                  if (value == 1) {
                    ref
                        .refresh(bookmarkProvider)
                        .addRestaurant(restaurant.idQuanAn);
                  }
                },
                itemBuilder: (context) => [
                  const PopupMenuItem(
                    value: 0,
                    child: Text('Xem thực đơn'),
                  ),
                  const PopupMenuItem(
                    value: 1,
                    child: Text('Yêu thích'),
                  ),
                  const PopupMenuItem(
                    value: 2,
                    child: Text('Báo cáo'),
                  )
                ],
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              RestaurantImage(restaurant: restaurant),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(3)
                },
                children: [
                  buildTableRow(
                    title: 'Quán ăn',
                    content: restaurant.tenQuanAn,
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'Đánh giá',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${restaurant.chatLuong}/5.0',
                              style: const TextStyle(
                                fontSize: 16,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Icon(
                              Icons.star_rate_rounded,
                              color: userTints4,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  buildTableRow(
                    title: 'Địa chỉ',
                    content: restaurant.diaChi,
                  ),
                  buildTableRow(
                    title: 'Điện thoại',
                    content: restaurant.soDienThoai,
                  ),
                  buildTableRow(
                    title: 'Giờ mở cửa',
                    content:
                        '${restaurant.gioMoCua} - ${restaurant.gioDongCua}',
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        verticalAlignment: TableCellVerticalAlignment.middle,
                        child: Text(
                          'Thể loại',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TableCell(
                        child: Wrap(
                          spacing: defaultPadding / 2,
                          children: [
                            ...restaurant.theLoai
                                .map((e) => Chip(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 0),
                                      label: Text(e.tenTheLoai),
                                      backgroundColor: userTints2,
                                    ))
                                .toList(),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  TableRow buildTableRow({required String title, required String content}) {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.middle,
          child: Container(
            alignment: Alignment.centerLeft,
            height: 60,
            child: Text(
              content,
              style: const TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
      ],
    );
  }
}
