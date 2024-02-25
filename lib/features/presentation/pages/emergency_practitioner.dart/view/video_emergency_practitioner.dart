import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lifeline/core/constant/assets_location.dart';
import 'package:lifeline/core/constant/color.dart';
import 'package:lifeline/core/routes/route_generator.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/state/callId_state.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/view/emergency_practitioner.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/map_view.dart';
import 'package:lifeline/features/presentation/pages/nearby_hospiatal/view/near_by_hospital_map.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class VideoCallEmegercyPratitioner extends ConsumerWidget {
  VideoCallEmegercyPratitioner(
      {super.key, required this.index, required this.name});
  final int index;
  final String name;
  List<EmergencyDoctorModel> fetchDoctor = EmergencyDoctorModel.fetchDocor;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final res = ref.watch(callIdStateNotifer);
    return res.when(
        data: (data) {
          return Stack(
            children: [
              ZegoUIKitPrebuiltCall(
                  userID: data.userId,
                  userName: name,
                  appID: int.parse(data.appId),
                  appSign: data.appSignIn,
                  callID: '1as267',
                  config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()
                    ..turnOnCameraWhenJoining = true
                    ..turnOnMicrophoneWhenJoining = true
                    ..video = ZegoUIKitVideoConfig.preset1080P()
                    ..bottomMenuBar = ZegoCallBottomMenuBarConfig(buttons: [
                      // ZegoCallMenuBarButtonName.chatButton,
                      // ZegoCallMenuBarButtonName.hangUpButton,
                      // ZegoCallMenuBarButtonName.showMemberListButton
                    ])),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 12),
                          // height: 50.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.blueGrey,
                              borderRadius: BorderRadius.circular(1000)),
                          child: Icon(
                            Icons.chat_outlined,
                            color: HexColors.blue10,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          // height: 50.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(1000)),
                          child: Icon(
                            Icons.call_end,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () =>
                            AppRoute.displayBottomSheet(context, MapView()),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          // height: 50.h,
                          // width: 50.w,
                          decoration: BoxDecoration(
                              color: AppColors.blueGrey,
                              borderRadius: BorderRadius.circular(1000)),
                          child: Icon(
                            Icons.my_location_rounded,
                            color: HexColors.blue10,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
          // plugins: [ZegoUIKitSignalingPlugin()],
          // ..bottomMenuBar = ZegoBottomMenuBarConfig(
          //   maxCount: 5,
          //   extendButtons: [
          //     Center(
          //       child: IconButton(
          //         onPressed: () {},
          //         // decoration:
          //         //     const BoxDecoration(color: AppColors.blueGrey),
          //         icon: Icon(
          //           Icons.chat_outlined,
          //           color: AppColors.white,
          //         ),
          //       ),
          //     ),
          //     IconButton(
          //       onPressed: () {},
          //       // decoration:
          //       //     const BoxDecoration(color: AppColors.blueGrey),
          //       icon: Icon(
          //         Icons.my_location_rounded,
          //         color: AppColors.white,
          //       ),
          //     ),
          //   ],

          // ));
        },
        error: (e, s) => Text(e.toString()),
        loading: () => const Center(
              child: CupertinoActivityIndicator(),
            ));
  }
}
