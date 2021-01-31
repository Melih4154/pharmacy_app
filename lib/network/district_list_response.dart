// To parse this JSON data, do
//
//     final districtListResponse = districtListResponseFromJson(jsonString);

import 'dart:convert';

DistrictListResponse districtListResponseFromJson(String str) =>
    DistrictListResponse.fromJson(json.decode(str));

String districtListResponseToJson(DistrictListResponse data) =>
    json.encode(data.toJson());

class DistrictListResponse {
  DistrictListResponse({
    this.status,
    this.message,
    this.systemTime,
    this.rowCount,
    this.data,
  });

  String status;
  String message;
  int systemTime;
  int rowCount;
  List<Datum> data;

  factory DistrictListResponse.fromJson(Map<String, dynamic> json) =>
      DistrictListResponse(
        status: json["status"],
        message: json["message"],
        systemTime: json["systemTime"],
        rowCount: json["rowCount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "systemTime": systemTime,
        "rowCount": rowCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.ilceAd,
    this.ilceSlug,
  });

  String ilceAd;
  String ilceSlug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        ilceAd: json["ilceAd"],
        ilceSlug: json["ilceSlug"],
      );

  Map<String, dynamic> toJson() => {
        "ilceAd": ilceAd,
        "ilceSlug": ilceSlug,
      };
}
