import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lifeline/core/service/api_service.dart';
import 'package:lifeline/core/service/exceptions.dart';
import 'package:lifeline/features/presentation/pages/emergency_practitioner.dart/model/video_id_model.dart';

final videoServieProvider = Provider((ref) => VideoCallIdService());

class VideoCallIdService extends APIService {
  // Future<Map<String, dynamic>> fectVideoId() async {
  //   final res = await post('/create_id/');
  //   print(res);
  //   return res;
  // }

  Future<VideoIdModel> fectVideoId() async {
    try {
      final response = await post('/create_id/');
      final responseBody = VideoIdModel.fromJson(response);
      return responseBody;
    } on DioException catch (e) {
      throw DioExceptions.fromDioError(e);
    }
  }
}
