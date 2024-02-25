// To parse this JSON data, do
//
//     final placeModel = placeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PlaceModel placeModelFromJson(String str) =>
    PlaceModel.fromJson(json.decode(str));

String placeModelToJson(PlaceModel data) => json.encode(data.toJson());

class PlaceModel {
  final String? businessStatus;
  final Geometry? geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? name;
  // final OpeningHours openingHours;
  // final List<Photo>? photos;
  final String? placeId;
  final PlusCode? plusCode;
  final double? rating;
  final String? reference;
  final String? scope;
  final List<String>? types;
  final int? userRatingsTotal;
  final String? vicinity;

  PlaceModel({
   this.businessStatus,
   this.geometry,
   this.icon,
   this.iconBackgroundColor,
   this.iconMaskBaseUri,
   this.name,
    // required this.openingHours,
    // required this.photos,
   this.placeId,
   this.plusCode,
   this.rating,
   this.reference,
   this.scope,
   this.types,
   this.userRatingsTotal,
   this.vicinity,
  });

  // factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
  //       businessStatus: json["business_status"],
  //       geometry: Geometry.fromJson(json["geometry"]),
  //       icon: json["icon"],
  //       iconBackgroundColor: json["icon_background_color"],
  //       iconMaskBaseUri: json["icon_mask_base_uri"],
  //       name: json["name"],
  //       // openingHours: OpeningHours?.fromJson(
  //       //     json["opening_hours"]),
  //       // photos: List<Photo>.from(json["photos"].map((x) => Photo.fromJson(x))),
  //       placeId: json["place_id"],
  //       plusCode: PlusCode.fromJson(json["plus_code"]),
  //       rating: json["rating"]?.toDouble() ?? 0.0,
  //       reference: json["reference"],
  //       scope: json["scope"],
  //       types: List<String>.from(json["types"].map((x) => x)),
  //       userRatingsTotal: json["user_ratings_total"] ?? 0,
  //       vicinity: json["vicinity"],
  //     );
  factory PlaceModel.fromJson(Map<String, dynamic>? json) {
  if (json == null) {
    // Handle the case where json is null, for example, by throwing an exception or returning a default value.
    throw ArgumentError("Json cannot be null");
  }

  return PlaceModel(
    businessStatus: json["business_status"] ?? "",
    geometry: Geometry.fromJson(json["geometry"] ?? {}),
    icon: json["icon"] ?? "",
    iconBackgroundColor: json["icon_background_color"] ?? "",
    iconMaskBaseUri: json["icon_mask_base_uri"] ?? "",
    name: json["name"] ?? "",
    placeId: json["place_id"] ?? "",
    plusCode: PlusCode.fromJson(json["plus_code"] ?? {}),
    rating: (json["rating"] as num?)?.toDouble() ?? 0.0,
    reference: json["reference"] ?? "",
    scope: json["scope"] ?? "",
    types: List<String>.from(json["types"] ?? []),
    userRatingsTotal: json["user_ratings_total"] as int? ?? 0,
    vicinity: json["vicinity"] ?? "",
  );
}


  Map<String, dynamic> toJson() => {
        "business_status": businessStatus,
        "geometry": geometry!.toJson(),
        "icon": icon,
        "icon_background_color": iconBackgroundColor,
        "icon_mask_base_uri": iconMaskBaseUri,
        "name": name,
        // "opening_hours": openingHours.toJson(),
        // "photos": List<dynamic>.from(photos!.map((x) => x.toJson())),
        "place_id": placeId,
        "plus_code": plusCode!.toJson(),
        "rating": rating,
        "reference": reference,
        "scope": scope,
        "types": List<dynamic>.from(types!.map((x) => x)),
        "user_ratings_total": userRatingsTotal,
        "vicinity": vicinity,
      };
}

class Geometry {
  final Location location;
  final Viewport viewport;

  Geometry({
    required this.location,
    required this.viewport,
  });

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
        location: Location.fromJson(json["location"]),
        viewport: Viewport.fromJson(json["viewport"]),
      );

  Map<String, dynamic> toJson() => {
        "location": location.toJson(),
        "viewport": viewport.toJson(),
      };
}

class Location {
  final double lat;
  final double lng;

  Location({
    required this.lat,
    required this.lng,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lng: json["lng"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class Viewport {
  final Location northeast;
  final Location southwest;

  Viewport({
    required this.northeast,
    required this.southwest,
  });

  factory Viewport.fromJson(Map<String, dynamic> json) => Viewport(
        northeast: Location.fromJson(json["northeast"]),
        southwest: Location.fromJson(json["southwest"]),
      );

  Map<String, dynamic> toJson() => {
        "northeast": northeast.toJson(),
        "southwest": southwest.toJson(),
      };
}

class OpeningHours {
  final bool openNow;

  OpeningHours({
    required this.openNow,
  });

  factory OpeningHours.fromJson(Map<String, dynamic> json) => OpeningHours(
        openNow: json["open_now"],
      );

  Map<String, dynamic> toJson() => {
        "open_now": openNow,
      };
}

class Photo {
  final int height;
  final List<String> htmlAttributions;
  final String photoReference;
  final int width;

  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        height: json["height"],
        htmlAttributions:
            List<String>.from(json["html_attributions"].map((x) => x)),
        photoReference: json["photo_reference"],
        width: json["width"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": List<dynamic>.from(htmlAttributions.map((x) => x)),
        "photo_reference": photoReference,
        "width": width,
      };
}

class PlusCode {
  final String compoundCode;
  final String globalCode;

  PlusCode({
    required this.compoundCode,
    required this.globalCode,
  });

  factory PlusCode.fromJson(Map<String, dynamic> json) => PlusCode(
        compoundCode: json["compound_code"],
        globalCode: json["global_code"],
      );

  Map<String, dynamic> toJson() => {
        "compound_code": compoundCode,
        "global_code": globalCode,
      };
}
