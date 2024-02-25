

// To parse this JSON data, do
//
//     final videoIdModel = videoIdModelFromJson(jsonString);

import 'dart:convert';

VideoIdModel videoIdModelFromJson(String str) => VideoIdModel.fromJson(json.decode(str));

String videoIdModelToJson(VideoIdModel data) => json.encode(data.toJson());

class VideoIdModel {
    final String userId;
    final String appSignIn;
    final String appId;

    VideoIdModel({
        required this.userId,
        required this.appSignIn,
        required this.appId,
    });

    factory VideoIdModel.fromJson(Map<String, dynamic> json) => VideoIdModel(
        userId: json["user_id"],
        appSignIn: json["appSignIn"],
        appId: json["appID"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "appSignIn": appSignIn,
        "appID": appId,
    };
}
