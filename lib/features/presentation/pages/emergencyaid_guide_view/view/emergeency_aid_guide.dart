// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/constant/spacing.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/emergencyaid_guide_view/model/emergency_aid_guide_model.dart';
import 'package:lifeline/features/presentation/pages/emergencyaid_guide_view/view/emergency_guild_view_details.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:lifeline/features/widget/custom_search_bar.dart';

class EmergencyAidGuidView extends StatefulWidget {
  EmergencyAidGuidView({Key? key}) : super(key: key);

  @override
  State<EmergencyAidGuidView> createState() => _EmergencyAidGuidViewState();
}

class _EmergencyAidGuidViewState extends State<EmergencyAidGuidView> {
  List<EmergencyAidModel> fetchList = EmergencyAidModel.getEmergencyList;

  // final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0),
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacingManager.h48,
          const AppBarWidget(label: 'Learn Emergency Aid'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // AppSearchBar(
                //   onChanged: (val) {
                //     setState(() {
                //       fetchList.where((e) => e.name
                //           .toString()
                //           .toLowerCase()
                //           .trim()
                //           .contains(searchController.text));
                //     });
                //   },
                // ),
                AppSearchBar(
                  onChanged: (val) {
                    setState(() {
                      if (val.isEmpty) {
                        fetchList = EmergencyAidModel.getEmergencyList;
                      } else {
                        fetchList = EmergencyAidModel.getEmergencyList
                            .where((e) => e.name
                                .toString()
                                .toLowerCase()
                                .trim()
                                .contains(val.toLowerCase().trim()))
                            .toList();
                      }
                    });
                  },
                ),
                SpacingManager.h10,
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.35,
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 0),
                    itemCount: fetchList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          AppRoute.navigateToRoute(EmergencyAidGuidViewDetails(
                            index: index,
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10.h),
                          padding: EdgeInsets.symmetric(
                              horizontal: 30.r, vertical: 20.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            border: Border.all(
                                color: const Color.fromRGBO(217, 217, 217, 0.6),
                                width: 2),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                fetchList[index].image,
                                height: 45.h,
                              ),
                              SpacingManager.w10,
                              Text(fetchList[index].name,
                                  style: GoogleFonts.openSans()),
                              const Spacer(),
                              Icon(
                                Icons.arrow_forward_ios,
                                size: 20.r,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
