import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lifeline/core/service/api_service.dart';
import 'package:lifeline/core/service/network_constant.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/model/nearby_place_model.dart';

final nearByProviderService = Provider((ref) => NearByService());

class NearByService extends APIService {
  // Future<List<PlaceModel>> getNearByPlace({
  //   required Position userLocation,
  //   required String keyWord,
  //   required String type,
  //   required double radius,
  // }) async {
  //   final keyWordParam = keyWord.isEmpty ? '' : keyWord;
  //   try {
  //     // Null check for API key and other required values
  //     if (nearByAPIKey == null ||
  //         userLocation == null ||
  //         userLocation.latitude == null ||
  //         userLocation.longitude == null ||
  //         type == null) {
  //       throw ArgumentError(
  //           'Invalid parameters: API key or required location information is missing.');
  //     }

  //     final url =
  //         'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=['']&location=${userLocation.latitude}%2C${userLocation.longitude}&radius=$radius&type=$type&key=$nearByAPIKey';

  //     final res = await get(url);

  //     if (res is Map<String, dynamic> && res.containsKey('results')) {
  //       List<dynamic> results = res['results'];
  //       List<PlaceModel> places =
  //           results.map((result) => PlaceModel.fromJson(result)).toList();
  //       print(res);

  //       print('LAT:${userLocation.latitude}');
  //       print('LONG:${userLocation.longitude}');
  //       print('Radius:${radius}');
  //       print('PLACES: $places');
  //       return places;
  //     } else {
  //       // Handle unexpected response format
  //       print('Unexpected response format: $res');
  //       return [];
  //     }
  //   } catch (e) {
  //     // Handle other unexpected errors
  //     print('Unexpected error in getNearByPlace: $e');
  //     return [];
  //   }
  // }

Future<List<Map<String, dynamic>>> getNearByPlace({
  required Position userLocation,
  String? keyWord,
  required String type,
  required double radius,
}) async {
  try {
    // Null check for API key and other required values
    if (nearByAPIKey == null ||
        userLocation == null ||
        userLocation.latitude == null ||
        userLocation.longitude == null ||
        type == null) {
      throw ArgumentError(
          'Invalid parameters: API key or required location information is missing.');
    }

    // Check if keyWord is null or empty, and provide a default value
    final keywordParam = keyWord?.isNotEmpty == true ? '&keyword=$keyWord' : '';

    final url = Uri.https(
      'maps.googleapis.com',
      '/maps/api/place/nearbysearch/json',
      {
        'location': '${userLocation.latitude},${userLocation.longitude}',
        'radius': '$radius',
        'type': type,
        'key': nearByAPIKey!,
      }..addAll(Uri.splitQueryString(keywordParam)),
    );

    final res = await get(url.toString());

    if (res is Map<String, dynamic> && res.containsKey('results')) {
      List<dynamic> results = res['results'];
      List<Map<String, dynamic>> places = results.cast<Map<String, dynamic>>();
      print(res);

      print('LAT:${userLocation.latitude}');
      print('LONG:${userLocation.longitude}');
      print('Radius:${radius}');
      print('PLACES: $places');
      return places;
    } else {
      // Handle unexpected response format
      print('Unexpected response format: $res');
      return [];
    }
  } catch (e) {
    // Handle other unexpected errors
    print('Unexpected error in getNearByPlace: $e');
    return [];
  }
}

  // Future<List<PlaceModel>> getNearByPlace(
  //     {required Position userLocation,
  //     required String keyWord,
  //     required String type,
  //     required double radius}) async {
  //   final url =
  //       'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=&location=${userLocation.latitude}%2C${userLocation.longitude}&radius=$radius&type=$type&key=$nearByAPIKey';
  //   // final url =
  //   final res = await get(url);
  //   final Map<String, dynamic> responseData = res;
  //   List<dynamic> results = responseData['results'];
  //   List<PlaceModel> places =
  //       results.map((result) => PlaceModel.fromJson(result)).toList();
  //   print(res);
  //   print('LAT:${userLocation.latitude}');
  //   print('LONG:${userLocation.longitude}');
  //   print('Radius:${radius}');
  //   //  if (await canLaunchUrl(Uri.parse(url))) {
  //   //   await launchUrl(Uri.parse(url));
  //   // } else {
  //   //   throw 'Could not launch Google Maps.';
  //   // }
  //   return places;
  // }
}
