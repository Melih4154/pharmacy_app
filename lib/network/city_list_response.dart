// To parse this JSON data, do
//
//     final cityListResponse = cityListResponseFromJson(jsonString);

import 'dart:convert';

CityListResponse cityListResponseFromJson(String str) =>
    CityListResponse.fromJson(json.decode(str));

String cityListResponseToJson(CityListResponse data) =>
    json.encode(data.toJson());

class CityListResponse {
  CityListResponse({
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

  factory CityListResponse.fromJson(Map<String, dynamic> json) =>
      CityListResponse(
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
    this.sehirAd,
    this.sehirSlug,
  });

  String sehirAd;
  String sehirSlug;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        sehirAd: json["SehirAd"],
        sehirSlug: json["SehirSlug"],
      );

  Map<String, dynamic> toJson() => {
        "SehirAd": sehirAd,
        "SehirSlug": sehirSlug,
      };
}
