import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';

import '../models/google_location/location_model.dart';
import '../models/restaurant/restaurant_model.dart';
import '../repositories/restaurant_state.dart';
import '../services/restaurant_services.dart';

final restaurantPredictionDataProvider =
    FutureProvider.family<List<LocationModel>, String>((ref, query) async {
  return ref.watch(restaurantProvider).fetchGooglePlaces(query);
});

final currentAddreddDataProvider =
    FutureProvider.family<List<LocationModel>, LocationData>(
        (ref, location) async {
  return ref.watch(restaurantProvider).reverseGeocoding(location);
});

final restaurantTypeDataProvider = FutureProvider(
    (ref) => ref.watch(restaurantProvider).fetchAllRestaurantType());

final addRestaurantProvider = FutureProvider.family<void, RestaurantModel>(
    (ref, restaurant) =>
        ref.read(restaurantProvider).addNewRestaurant(restaurant));

final getRestaurantByUserIdProvider =
    FutureProvider.family<List<RestaurantModel>, int>((ref, userId) =>
        ref.watch(restaurantProvider).getRestaurantByUserId(userId));

final getRestaurantByIdProvider = FutureProvider.family<RestaurantModel, int>(
    (ref, id) => ref.watch(restaurantProvider).getRestaurantById(id));

final updateRestaurantController = StateNotifierProvider.family
    .autoDispose<RestaurantNotifier, RestaurantModel, RestaurantModel>(
        (ref, restaurant) {
  return RestaurantNotifier(restaurantModel: restaurant);
});
