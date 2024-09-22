import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:good_food/srcs/core/color_scheme.dart';
import 'package:good_food/srcs/providers/restaurant_provider.dart';
import 'package:location/location.dart';

import 'widgets/prediction_location_list.dart';
import 'widgets/search_location.dart';
import 'widgets/use_current_location.dart';

class LocationScreen extends ConsumerStatefulWidget {
  static const String route = "ro/restaurant/location";
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends ConsumerState<LocationScreen> {
  final TextEditingController controller = TextEditingController();
  String inputValue = "";
  var locationData = LocationData.fromMap({});
  bool isUsingCurrent = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onChangeValue(value) {
    setState(() {
      isUsingCurrent = false;
      inputValue = value;
    });
  }

  void getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return null;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    var tempLocationData = await location.getLocation();
    setState(() {
      isUsingCurrent = true;
      locationData = tempLocationData;
    });
    controller.clear();
    return;
  }

  @override
  Widget build(BuildContext context) {
    final predictions = ref.watch(restaurantPredictionDataProvider(inputValue));
    final currentPredictions =
        ref.watch(currentAddreddDataProvider(locationData));

    return SafeArea(
      child: LayoutBuilder(
        builder: (context, constraints) => Scaffold(
          appBar: AppBar(
            title: const Text(
              "Địa chỉ",
              style: TextStyle(
                color: commonDark,
              ),
            ),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SearchField(
                iconData: Icons.location_pin,
                context: context,
                onChange: onChangeValue,
                controller: controller,
                hint: "Tìm kiếm địa chỉ quán ăn",
              ),
              const Divider(
                color: commonLightGrey,
                height: 4,
                thickness: 1,
              ),
              UseCurrentLocation(context: context, onPress: getCurrentLocation),
              const Divider(
                color: commonLightGrey,
                height: 4,
                thickness: 1,
              ),
              !isUsingCurrent
                  ? predictions.when(
                      data: (data) => PredictionLocationList(data: data),
                      error: (e, s) => Text(e.toString()),
                      loading: () => const Center(
                        child: CircularProgressIndicator(
                          color: userTints1,
                          strokeWidth: 3,
                        ),
                      ),
                    )
                  : currentPredictions.when(
                      data: (data) => PredictionLocationList(data: data),
                      error: (e, s) => Text(e.toString()),
                      loading: () => const Center(
                        child: CircularProgressIndicator(
                          color: userTints1,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
