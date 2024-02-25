// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/model/nearby_place_model.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/state/near_by_state.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/widget/locations_widget.dart';
import 'package:lifeline/features/widget/custom_search_bar.dart';

class NearestHospitalSheet extends ConsumerStatefulWidget {
  NearestHospitalSheet({super.key});

  @override
  ConsumerState<NearestHospitalSheet> createState() =>
      _NearestHospitalSheetConsumerState();
}

class _NearestHospitalSheetConsumerState
    extends ConsumerState<NearestHospitalSheet> {
  @override
  Widget build(
    BuildContext context,
  ) {
    final res = ref.watch(nearbyStateNotiferProvider);
    List<Map<String, dynamic>> fetchList = [];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          AppRoute.dividerModelSheet(),
          SpacingManager.h10,
          Column(
            children: [
              switch (res) {
                AsyncValue<List<Map<String, dynamic>>>(:final valueOrNull?) =>
                  AppSearchBar(
                    onChanged: (val) {
                      if (val.isNotEmpty) {
                        setState(() {
                          fetchList = valueOrNull
                              .where((e) => e['name']
                                  .toString()
                                  .toLowerCase()
                                  .trim()
                                  .contains(val.toLowerCase().trim()))
                              .toList();
                          ref.read(nearbyStateNotiferProvider.notifier).state =
                              AsyncValue.data(fetchList);
                          print(fetchList);
                        });
                      }
                    },
                  ),
                AsyncValue(:final error?) => Text('Error: $error'),
                _ => const CircularProgressIndicator.adaptive(),
              },
            ],
          ),
          SpacingManager.h14,
          switch (res) {
            AsyncValue<List<Map<String, dynamic>>>(:final valueOrNull?) =>
              valueOrNull.isEmpty
                  ? Column(
                      children: [
                        SpacingManager.h48,
                        SpacingManager.h48,
                        Image.asset(Assets.clinic),
                        SpacingManager.h13,
                        Text(
                          'We apologize for the inconvenience. It appears the hospital you searched for is unavailable. Please consider searching for another nearby hospital or medical facility.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.openSans(fontSize: 14.sp),
                        ),
                      ],
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height / 1.2,
                      child: ListView.builder(
                          // shrinkWrap: true,
                          itemCount: valueOrNull.length,
                          // locationCard.length,
                          itemBuilder: (context, index) {
                            return LocationSearchWidget(
                              hospital: valueOrNull[index]['name'] ?? '',
                              kilometer: '',
                              time: valueOrNull[index]['business_status'] ?? '',
                            );
                            //  const LocationSearchWidget(
                            //   hospital: 'Jaja Clinic',
                            //   kilometer: '25km',
                            //   time: '15mins',
                            // );
                          }),
                    ),
            AsyncValue(:final error?) => Text('Error: $error'),
            _ => const CircularProgressIndicator.adaptive(),
          }
        ],
      ),
    );
  }
}
