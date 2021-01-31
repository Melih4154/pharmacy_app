import 'dart:convert';
import 'package:eczane_app/network/district_list_response.dart';
import 'package:http/http.dart' as htttp;

class DistrictListAPI {
  static const Map<String, String> header = {"Authorization": ""};

  Future<DistrictListResponse> getDistrict({String city}) async {
    final res = await htttp.get(
        "https://www.nosyapi.com/apiv2/pharmacy/city?city=$city",
        headers: header);

    final response = json.decode(res.body);
    return districtListResponseFromJson(jsonEncode(response));
  }
}
