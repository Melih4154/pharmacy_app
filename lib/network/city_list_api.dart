import 'dart:convert';

import 'package:eczane_app/network/city_list_response.dart';
import 'package:http/http.dart' as htttp;

class CityListAPI {
  static const Map<String, String> header = {"Authorization": ""};

  Future<CityListResponse> getCity() async {
    final res = await htttp.get("https://www.nosyapi.com/apiv2/pharmacy/city",
        headers: header);

    final response = json.decode(res.body);
    return cityListResponseFromJson(jsonEncode(response));
  }
}
