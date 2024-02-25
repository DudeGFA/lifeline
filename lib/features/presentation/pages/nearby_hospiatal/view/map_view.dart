import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/service/network_constant.dart';
import 'package:url_launcher/url_launcher.dart';

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? mapController;
  LatLng? userLocation;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        // AppRoute.displayBottomSheet(context, const EmergencySheet());
      });
    });
  }

  void _getUserLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    userLocation = LatLng(position.latitude, position.longitude);
    showHospitalsOnMap();
    setState(() {});
  }

  void showHospitalsOnMap() async {
    if (userLocation != null) {
      List<LatLng> hospitalLocations = await findNearbyHospitals();
      for (LatLng location in hospitalLocations) {
        Marker marker = Marker(
          markerId: MarkerId(location.toString()),
          position: location,
          infoWindow: const InfoWindow(
            title: "Hospital",
          ),
        );
        markers.add(marker);
      }
      // Update the map with the new markers
      mapController?.moveCamera(CameraUpdate.newLatLng(userLocation!));
      setState(() {});
    }
  }

  Future<List<LatLng>> findNearbyHospitals() async {
    Dio dio = Dio();
    final url =
        'https://maps.googleapis.com/maps/api/place/nearbysearch/json?keyword=&location=${userLocation!.latitude}%2C${userLocation!.longitude}&radius=100000&type=hospital&key=$nearByAPIKey';
    var response = await dio.get(url);
    List data = response.data["results"];
    List<LatLng> hospitalLocations = [];
    for (Map<String, dynamic> item in data) {
      LatLng location = LatLng(item["geometry"]["location"]["lat"],
          item["geometry"]["location"]["lng"]);
      hospitalLocations.add(location);
      // Create and add marker for each hospital
      Marker marker = Marker(
        markerId: MarkerId(location.toString()),
        position: location,
        infoWindow: const InfoWindow(
          title: "Hospital",
        ),
      );
      setState(() {
        markers.add(marker);
      });
    }
    return hospitalLocations;
  }

  // void showHospitalsOnMap() async {
  //   await findNearbyHospitals();
  //   // await mapController?.updateMarkers(markers.toSet()); // Refresh map with markers
  // // }

  // void showHospitalsOnMap() async {
  //   List<LatLng> hospitalLocations = await findNearbyHospitals();
  //   // Update markers on the map
  //   // await mapController?.clearMarkers();
  //   for (LatLng location in hospitalLocations) {
  //     Marker marker = Marker(
  //       markerId: MarkerId(location.toString()),
  //       position: location,
  //       infoWindow: const InfoWindow(
  //         title: "Hospital",
  //       ),
  //     );
  //     setState(() {
  //       markers.add(marker);
  //     });
  //   }
  //   // Launch Google Maps navigation
  //   launchGoogleMapsNavigation();
  // }

  void launchGoogleMapsNavigation() async {
    // Check if Google Maps app is installed on device
    if (await canLaunchUrl(Uri.parse('https://www.google.com/maps'))) {
      // Build directions URL with user location and nearby hospitals
      String origin = "${userLocation!.latitude},${userLocation!.longitude}";
      String waypoints = "";
      for (LatLng location in markers.map((marker) => marker.position)) {
        waypoints += "&waypoints=${location.latitude},${location.longitude}";
      }
      String destination =
          waypoints.isEmpty ? "" : waypoints.substring(9); // Remove leading "&"
      String url =
          "https://www.google.com/maps/dir/?api=1&origin=$origin$waypoints&destination=$destination&travelmode=driving";
      // Launch Google Maps app with directions
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch Google Maps.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,

      child: Stack(
        children: [
          userLocation == null
              ? const Center(child: CircularProgressIndicator())
              : GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: userLocation ?? const LatLng(0, 0),
                    zoom: 14,
                  ),
                  onMapCreated: (controller) => mapController = controller,
                  markers: markers.toSet(), // Set markers directly on GoogleMap
                ),
        ],
      ),
    );
  }
}
