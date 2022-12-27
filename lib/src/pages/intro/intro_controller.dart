import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:maxkgapp/src/helpers/app_router.dart';
import 'package:maxkgapp/src/helpers/prefs.dart';
import 'package:maxkgapp/src/pages/home/home_page_controller.dart';
import 'package:maxkgapp/src/pages/shopping_cart/shopping_cart_page_controller.dart';

class IntroController extends GetxController {
  final cardController = Get.put(ShoppingCartPageController());

  late StreamSubscription<Position> positionStream;

  void onDonePress() {
    Prefs.firstTime = false;
    Get.offNamed(AppRouter.main);
  }

  Future<void> streamPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    final LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    onDonePress();
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) async {
          if (position == null) {
            print('Unknown');
          } else {
            final box = GetStorage();
            box.write('location',
                '${position.latitude.toString()}, ${position.longitude
                    .toString()}');

            try {
              List<Placemark> placemarks = await placemarkFromCoordinates(
                position.latitude,
                position.longitude,
              );
              cardController.selectedCity.value = placemarks[0].locality.toString();
            } catch (err) {}

            ever(cardController.selectedCity , (value) {
              final box = GetStorage();
              box.write('location', cardController.selectedCity.value);
            });

            print("место");
            print(cardController.selectedCity.value);

            positionStream.cancel();
          }
        });
  }
}
