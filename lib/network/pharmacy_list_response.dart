// To parse this JSON data, do
//
//     final pharmacyListResponse = pharmacyListResponseFromJson(jsonString);

import 'dart:convert';

PharmacyListResponse pharmacyListResponseFromJson(String str) =>
    PharmacyListResponse.fromJson(json.decode(str));

String pharmacyListResponseToJson(PharmacyListResponse data) =>
    json.encode(data.toJson());

class PharmacyListResponse {
  PharmacyListResponse({
    this.status,
    this.message,
    this.rowCount,
    this.data,
  });

  String status;
  String message;
  int rowCount;
  List<Datum> data;

  factory PharmacyListResponse.fromJson(Map<String, dynamic> json) =>
      PharmacyListResponse(
        status: json["status"],
        message: json["message"],
        rowCount: json["rowCount"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "rowCount": rowCount,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.eczaneAdi,
    this.adresi,
    this.yolTarifi,
    this.telefon,
    this.sehir,
    this.ilce,
    this.latitude,
    this.longitude,
    this.eczaneDetay,
    this.nobetciDurumu,
  });

  String eczaneAdi;
  String adresi;
  String yolTarifi;
  String telefon;
  String sehir;
  String ilce;
  double latitude;
  double longitude;
  String eczaneDetay;
  bool nobetciDurumu;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        eczaneAdi: json["EczaneAdi"],
        adresi: json["Adresi"],
        yolTarifi: json["YolTarifi"],
        telefon: json["Telefon"],
        sehir: json["Sehir"],
        ilce: json["ilce"],
        latitude: json["latitude"].toDouble(),
        longitude: json["longitude"].toDouble(),
        eczaneDetay: json["eczaneDetay"],
        nobetciDurumu: json["NobetciDurumu"],
      );

  Map<String, dynamic> toJson() => {
        "EczaneAdi": eczaneAdi,
        "Adresi": adresi,
        "YolTarifi": yolTarifi,
        "Telefon": telefon,
        "Sehir": sehir,
        "ilce": ilce,
        "latitude": latitude,
        "longitude": longitude,
        "eczaneDetay": eczaneDetay,
        "NobetciDurumu": nobetciDurumu,
      };
}
