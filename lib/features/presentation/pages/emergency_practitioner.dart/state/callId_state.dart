import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/model/video_id_model.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/service/video_call_id.dart';

final callIdStateNotifer =
    StateNotifierProvider<CallIDState, AsyncValue<VideoIdModel>>(
        (ref) => CallIDState(ref));

// class CallIDState extends StateNotifier<AsyncValue<Map<String, dynamic>>> {
//   CallIDState(this.ref) : super(const AsyncData({})) {
//     fetchId();
//   }

//   Ref ref;
//   Future fetchId() async {
//     try {
//       state = const AsyncLoading();
//       final response = ref.read(videoServieProvider).contactUs();
//       state = AsyncData(ress);
//     } on DioException catch (e) {}
//   }
// }

class CallIDState extends StateNotifier<AsyncValue<VideoIdModel>> {
  CallIDState(this.ref) : super(const AsyncLoading()) {
    fectVideoId();
  }

  final Ref ref;

  Future<void> fectVideoId() async {
    try {
      state = const AsyncLoading();
      final response = await ref.read(videoServieProvider).fectVideoId();

      state = AsyncValue.data(response);
    } catch (e) {
      state = AsyncError(e, StackTrace.current);
    }
  }
}
