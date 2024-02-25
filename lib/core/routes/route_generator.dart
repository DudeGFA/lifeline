import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifeline/core/constant/color.dart';

// class RouteGenerator {
//   static Route? onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case Routes.splashScreen:
//         return MaterialPageRoute(builder: (context) => const SplashScreen(key: ValueKey(Routes.splashScreen)), settings: settings);

//       default:
//         return null;
//     }
//   }

//   static Route unKnownRoute(_) {
//     return MaterialPageRoute(
//       builder: (context) => const Scaffold(
//         body: Center(child: Text("Page Not Found")),
//       ),
//     );
//   }
// }

void dismissKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

abstract class AppRoute {
  AppRoute._();

  static GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();
  static GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  void dismissKeyboard_1() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void popSheet() {
    Navigator.of(navigatorKey!.currentContext!).pop();
  }

  void closeDialog() {
    Navigator.of(navigatorKey!.currentContext!, rootNavigator: true).pop();
  }

  static navigateToRoute(dynamic routeClass) {
    Navigator.push(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass));
  }

  static void navigateAndRemoveUntilRoute(dynamic routeClass) {
    Navigator.pushAndRemoveUntil(navigatorKey!.currentContext!,
        CupertinoPageRoute(builder: (context) => routeClass), (route) => false);
  }

  static navigateWithoutBottomNav(dynamic routeClass) {
    Navigator.of(navigatorKey!.currentContext!, rootNavigator: true).push(
      CupertinoPageRoute(builder: (context) => routeClass),
    );
  }

  static displayBottomSheet(context, Widget bottomSheet) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: AppColors.blueGrey,
        // Theme.of(context).scaffoldBackgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0))),
        builder: (context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Wrap(
              children: [
              const  Center(
                    // child: dividerModelSheet(),
                    ),
                GestureDetector(onTap: dismissKeyboard, child: bottomSheet),
              ],
            )));
  }

  static Widget dividerModelSheet() {
    return Container(
      width: 47,
      height: 4,
      margin: const EdgeInsets.symmetric(vertical: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey.withOpacity(0.4)),
    );
  }

  static Future displayBottomSheetForLogin(context, Widget bottomSheet) async {
    // bool isDark = Theme.of(context).brightness == Brightness.dark;

    final res = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,

      // backgroundColor: Theme.of(context).colorScheme.primary,
      backgroundColor: AppColors.blueGrey,
      // isDark ? const Color(0xFF0E1F17) : AppColors.blueGrey,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
      builder: (context) => _DraggableBackdropBottomSheet(child: bottomSheet),
    );

    return await res;
  }
}

class _DraggableBackdropBottomSheet extends ConsumerWidget {
  final Widget child;

  const _DraggableBackdropBottomSheet({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return WillPopScope(
      onWillPop: () async {
        // ref.read(bottomSheetStateProvider.notifier).update((state) => false);
        return true; // Allow back button to dismiss
      },
      child: GestureDetector(
        onTap: () {
          // Dismiss bottom sheet when tapped outside the content
          // ref.read(bottomSheetStateProvider.notifier).update((state) => false);
          Navigator.pop(context);
        },
        child: DraggableScrollableSheet(
            expand: false,
            builder: (context, scrollController) {
              return NotificationListener<DraggableScrollableNotification>(
                onNotification: (notification) {
                  if (notification.extent == 0.0) {
                    // User has scrolled down to dismiss the bottom sheet
                    // ref.read(bottomSheetStateProvider.notifier).update((state) => false);
                    // print(ref.read(bottomSheetStateProvider));
                    Navigator.pop(context);
                  }
                  return true;
                },
                child: SingleChildScrollView(
                  controller: scrollController,
                  child: Padding(
                    padding: MediaQuery.of(context).viewInsets,
                    child: _WillpopBottomSheet(child: child),
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class _WillpopBottomSheet extends ConsumerWidget {
  const _WillpopBottomSheet({required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context, ref) {
    return WillPopScope(
      onWillPop: () async {
        // ref.read(bottomSheetStateProvider.notifier).update((state) => false);
        Navigator.pop(context);
        // print(ref.read(bottomSheetStateProvider));
        return true;
      },
      child: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: Wrap(
          children: [
            // Center(
            //   child: dividerModelSheet(),
            // ),
            GestureDetector(onTap: dismissKeyboard, child: child),
          ],
        ),
      ),
    );
  }
}
