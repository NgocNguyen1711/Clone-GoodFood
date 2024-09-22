import 'package:flutter/material.dart';
import 'package:good_food/srcs/screen/sample_pages/notification.dart';
import 'package:good_food/srcs/screen/user/bookmark/bookmark.dart';
import 'package:good_food/srcs/screen/user/change_password/change_password.dart';
import 'package:good_food/srcs/screen/user/chats/chat.dart';
import 'package:good_food/srcs/screen/user/edit_profile/edit_user_profile.dart';
import 'package:good_food/srcs/screen/user/new_post/new_dish/new_dish_screen.dart';
import 'package:good_food/srcs/screen/user/new_post/new_dish/select_dish_screen.dart';
import 'package:good_food/srcs/screen/user/profile/user_profile.dart';
import 'package:good_food/srcs/screen/user/setting/setting.dart';
import 'package:good_food/srcs/screen/user/view_restaurant/view_restaurant.dart';
import 'package:good_food/srcs/screen/user/view_restaurant_menu/view_restaurant_menu.dart';

import '../screen/choose_tags_screen/choose_tags_screen.dart';
import '../screen/restaurant_owner/add_new_restaurant_screen/location_screen/location_screen.dart';
import '../screen/restaurant_owner/restaurant_detail_screen/restaurant_detail_screen.dart';
import '../screen/sign_up_sign_in_screen/sign_in_screen.dart';
import '../screen/user/comments/comments_screen.dart';
import '../screen/user/home/user_home.dart';
import '../screen/user/new_post/new_post_screen.dart';
import '../screen/user/new_post/select_restaurant_screen.dart';
import '../screen/user/post_detail/post_detail_screen.dart';
import '../screen/user/welcome_screen/welcome_screen.dart';
import '/srcs/screen/restaurant_owner/add_new_restaurant_screen/add_new_restaurant_screen.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AddNewRestaurantScreen.route: (context) => AddNewRestaurantScreen(),
  LocationScreen.route: (context) => const LocationScreen(),
  RestaurantDetailScreen.route: (context) => const RestaurantDetailScreen(),
  PostDetailScreen.route: (context) => const PostDetailScreen(),
  WelcomeScreen.route: (context) => const WelcomeScreen(),
  ChooseTagsScreen.route: (p0) => const ChooseTagsScreen(),
  SignInScreen.route: (p0) => const SignInScreen(),
  UserHomeScreen.route: (p0) => const UserHomeScreen(),
  CommentsScreen.route: (p0) => const CommentsScreen(),
  SelectRestaurant.route: (p0) => const SelectRestaurant(),
  NewPostScreen.route: (p0) => const NewPostScreen(),
  NewDishReviewScreen.route: (p0) => NewDishReviewScreen(),
  SelectDishScreen.route: (p0) => const SelectDishScreen(),
  EditUserProfileScreen.route: (p0) => const EditUserProfileScreen(),
  ViewRestaurantScreen.route: (p0) => const ViewRestaurantScreen(),
  ViewRestaurantMenuScreen.route: (p0) => const ViewRestaurantMenuScreen(),
  UserProfileScreen.route: (p0) => const UserProfileScreen(),
  BookMarkScreen.route: (p0) => const BookMarkScreen(),
  LogoutScreen.route: (p0) => const LogoutScreen(),
  ChatScreen.route: (p0) => const ChatScreen(),
  SettingScreen.route: (p0) => const SettingScreen(),
  ChangePasswordScreen.route: (p0) => ChangePasswordScreen(),
};
