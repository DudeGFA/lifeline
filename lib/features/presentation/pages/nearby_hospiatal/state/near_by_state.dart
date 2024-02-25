import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lifeline/core/service/exceptions.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/model/nearby_place_model.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/service/nearby_service.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/state/locaton_state.dart';
import 'package:url_launcher/url_launcher.dart';

final nearbyStateNotiferProvider =
    StateNotifierProvider<NearByState, AsyncValue<List<Map<String, dynamic>>>>(
        (ref) {
  return NearByState(ref: ref);
});

// class NearByState extends StateNotifier<AsyncValue<List<PlaceModel>>> {
//   NearByState({required this.ref}) : super(const AsyncLoading()) {}

//   Ref ref;
//   List<Marker> marker = [];
//   Future<void> fetchNearByHospital(Position location, String placeName) async {
//     try {
//       List<Placemark> placeMark =
//           await placemarkFromCoordinates(location.latitude, location.longitude);
//       Placemark marks = placeMark[0];
//       var point = LatLng(location.latitude, location.longitude);

//       marker.add(Marker(markerId: MarkerId(placeName), position: point));

//       final res = await ref.read(nearByProviderService).getNearByPlace(
//           userLocation: Position(
//               longitude: location.longitude,
//               latitude: location.latitude,
//               accuracy: 0,
//               altitude: 0,
//               altitudeAccuracy: 0,
//               heading: 0,
//               headingAccuracy: 0,
//               speed: 0,
//               speedAccuracy: 0,
//               timestamp: DateTime.now(),
//               floor: 0,
//               isMocked: false),
//           keyWord: '',
//           type: 'hospital',
//           radius: 50000.0);

//       state = AsyncValue.data(res);
//     } on DioException catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e);
//       state = AsyncValue.error(errorMessage, StackTrace.current);
//     }
//   }

class NearByState
    extends StateNotifier<AsyncValue<List<Map<String, dynamic>>>> {
  NearByState({required this.ref}) : super(const AsyncLoading()) {
    fetchNearByHospital();
  }

  Ref ref;
  List<Marker> marker = [];

  Future<void> fetchNearByHospital() async {
    Position location = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    try {
      // List<Placemark> placeMark =
      //     await placemarkFromCoordinates(location.latitude, location.longitude);
      // Placemark marks = placeMark[0];
      // var point = LatLng(location.latitude, location.longitude);

      // marker.add(Marker(markerId: MarkerId(placeName), position: point));

      final res = await ref.read(nearByProviderService).getNearByPlace(
            userLocation: Position(
              longitude: location.longitude,
              latitude: location.latitude,
              accuracy: 100,
              altitude: 0,
              altitudeAccuracy: 0,
              heading: 0,
              headingAccuracy: 0,
              speed: 0,
              speedAccuracy: 0,
              timestamp: DateTime.now(),
              floor: 0,
              isMocked: false,
            ),
            keyWord: '',
            type: 'hospital',
            radius: 100000.0,
          );

      if (res != null) {
        state = AsyncValue.data(res);
      } else {
        // Handle the case where res is null (perhaps an empty response)
        state = const AsyncValue.data([]);
      }
    } on DioException catch (e) {
      final errorMessage = DioExceptions.fromDioError(e);
      state = AsyncValue.error(errorMessage, StackTrace.current);
    } catch (e) {
      // Handle any other unexpected errors
      state = AsyncValue.error('Unexpected error occurred', StackTrace.current);
    }
  }
}
