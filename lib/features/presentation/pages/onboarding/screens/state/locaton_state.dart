import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/home/view/home_screen.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/onboarding2.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/onboarding3.dart';
import 'package:lifeline/features/widget/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';

final locationProvider =
    ChangeNotifierProvider<LocatonState>((ref) => LocatonState());

class LocatonState extends ChangeNotifier {
  //  Position? currentLocation;

  bool servicePersmission = false;

  late LocationPermission permission;

  String? currentAddress;

  Future<Position> getUserLocation(context) async {
    servicePersmission = await Geolocator.isLocationServiceEnabled();
    if (!servicePersmission) {
      print('object');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always) {
      Navigator.push(context, SizeTransition2(const Onboarding2()));
      getAddresFromCoordinate();
    }
    if (permission == LocationPermission.whileInUse) {
      Navigator.push(context, SizeTransition2(const Onboarding2()));
      getAddresFromCoordinate();
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    return await Geolocator.getCurrentPosition();
  }

  getAddresFromCoordinate() async {
    Position currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    try {
      print('Hi');
      List<Placemark> placeMark = await placemarkFromCoordinates(
        currentLocation.latitude,
        currentLocation.longitude,
      );
      Placemark place = placeMark[0];

      currentAddress = '${place.thoroughfare}';

      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<void> checkAndRequestCameraPermission() async {
    // Check if camera permission is granted
    PermissionStatus cameraStatus = await Permission.camera.status;

    if (cameraStatus.isGranted) {
      AppRoute.navigateAndRemoveUntilRoute(
          const HomeScreen()); // Camera permission is already granted
      // You can proceed with camera-related tasks
    } else {
      // Camera permission is not granted, request it
      PermissionStatus result = await Permission.camera.request();

      if (result.isGranted) {
        // Camera permission granted
        // Proceed with camera-related tasks
      } else {
        print('Error');
        // Camera permission denied by the user
        // Handle accordingly (e.g., show a message or disable camera features)
      }
    }
  }

  Future<void> checkAndRequestAudioPermission(context) async {
    // Check if audio permission is granted
    PermissionStatus audioStatus = await Permission.microphone.status;

    if (audioStatus.isGranted) {
      Navigator.push(context, SizeTransition2(const Onboarding3()));
      // Audio permission is already granted
      // You can proceed with audio-related tasks
    } else {
      // Audio permission is not granted, request it
      PermissionStatus result = await Permission.microphone.request();

      if (result.isGranted) {
        // Audio permission granted
        // Proceed with audio-related tasks
      } else {
        // Audio permission denied by the user
        // Handle accordingly (e.g., show a message or disable audio features)
      }
    }
  }
}
