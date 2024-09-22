import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageIndex extends StateNotifier<int> {
  PageIndex() : super(0);

  int changePageIndex({required int index}) {
    state = index;
    return state;
  }
}

final pageIndexProvider =
    StateNotifierProvider<PageIndex, int>((ref) => PageIndex());
