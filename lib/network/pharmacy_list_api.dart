import 'dart:convert';
import 'package:eczane_app/network/pharmacy_list_response.dart';
import 'package:http/http.dart' as htttp;

class PharmacyListAPI {
  static const Map<String, String> header = {"Authorization": ""};

  Future<PharmacyListResponse> getPharmacy(
      {String city, String district}) async {
    final res = await htttp.get(
        "https://www.nosyapi.com/apiv2/pharmacy?city=$city&county=$district",
        headers: header);

    final response = json.decode(res.body);
    return pharmacyListResponseFromJson(jsonEncode(response));
  }
}
