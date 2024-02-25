// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/core/service/network_constant.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/model/nearby_place_model.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/state/near_by_state.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/nearest_hospital_sheet.dart';
import 'package:lifeline/features/presentation/pages/onboarding/screens/state/locaton_state.dart';
import 'package:lifeline/features/widget/custom_button.dart';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

// const apiKey = "YOUR_GOOGLE_MAPS_API_KEY"; // Replace with your actual API key

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// Replace with your actual API key

class NearbyHospitalMap extends StatefulWidget {
  @override
  _NearbyHospitalMapState createState() => _NearbyHospitalMapState();
}

class _NearbyHospitalMapState extends State<NearbyHospitalMap> {
  GoogleMapController? mapController;
  LatLng? userLocation;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        AppRoute.displayBottomSheet(context, const EmergencySheet());
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nearest Hospitals",
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600, fontSize: 18.sp),
        ),
      ),
      body: Stack(
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
          // Center(
          //   child: userLocation == null
          //       ? const CircularProgressIndicator()
          //       : const Text('Location found!'),
          // ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () async {
                // showHospitalsOnMap();
                launchGoogleMapsNavigation();
              },
              child: const Icon(Icons.navigation),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () =>
            AppRoute.displayBottomSheet(context, const EmergencySheet()),
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width / 6, vertical: 5.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              10,
            ),
            color: HexColors.blue10,
          ),
          height: 20,
          width: MediaQuery.of(context).size.width / 1.5,
          // padding: EdgeInsets.symmetric(
          //     horizontal: MediaQuery.of(context).size.width / 1.5,
          //     vertical: 10.h),
        ),
      ),
    );
  }
}

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // SvgPicture.asset(Assets.arrowBack),
        IconButton(
            onPressed: () {
              AppRoute.popSheet();
            },
            icon: const Icon(
              Icons.arrow_back,
              color: AppColors.blackColor,
            )),
        Text(
          label,
          style: GoogleFonts.openSans(
              fontWeight: FontWeight.w600, fontSize: 18.sp),
        ),
        SpacingManager.w10,
      ],
    );
  }
}

class EmergencySheet extends ConsumerWidget {
  const EmergencySheet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(locationProvider);
    final res = ref.watch(nearbyStateNotiferProvider);
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
      width: double.infinity,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              LocationWidget(
                image: Assets.carbonLocation,
                label: 'Your current Location',
                location: state.currentAddress ?? '',
                color: HexColors.blue10,
                onTap: () {},
              ),
              LocationWidget(
                image: Assets.hospital,
                label: 'Nearest Hospital',
                location: res.value?[0]['name'] ?? '',
                color: AppColors.secondaryColor,
                onTap: () {
                  Navigator.pop(context);
                  AppRoute.displayBottomSheetForLogin(
                      context, NearestHospitalSheet());
                },
              ),
            ],
          ),
          SpacingManager.h29,
          PrimaryButton(
            onPressed: () {},
            buttonColor: HexColors.blue10,
            enableButton: true,
            buttonTitle: 'Call an Emergency Practitioner',
          ),
          SpacingManager.h13,
          PrimaryButton(
            onPressed: () {},
            buttonColor: AppColors.blueGrey,
            borderColor: HexColors.blue10,
            enableButton: true,
            buttonTitleTextStyle: GoogleFonts.openSans(color: HexColors.blue10),
            buttonTitle: 'Fastest Route',
            borderWidth: 2,
          ),
        ],
      ),
    );
  }
}

class LocationWidget extends StatelessWidget {
  final String label;
  final String image;
  final String location;
  final Color color;
  final VoidCallback onTap;
  const LocationWidget({
    Key? key,
    required this.label,
    required this.image,
    required this.location,
    required this.color,
    required this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(8.r)),
            child: SvgPicture.asset(image),
          ),
          SpacingManager.w10,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: GoogleFonts.openSans(fontSize: 12.sp),
              ),
              Text(
                location,
                style: GoogleFonts.openSans(fontSize: 9.sp),
              )
            ],
          )
        ],
      ),
    );
  }
}
