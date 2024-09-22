import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:good_food/srcs/models/nguoidung.dart';

abstract class INguoiDungRepository {
  Future<NguoiDungResponse> fetchUserDetails();
}

class NguoiDungRepository implements INguoiDungRepository {
  final _host = "https://localhost:7030/NguoiDung/GetNguoiDung/1";
  final Map<String, String> _headers = {
    "Accept": "application/json",
    "contect-type": "application/json"
  };

  @override
  Future<NguoiDungResponse> fetchUserDetails() async {
    var getNguoiDungUrl = _host;

    var results = await http.get(Uri.parse(getNguoiDungUrl), headers: _headers);

    final jsonObject = json.decode(results.body);

    var response = NguoiDungResponse.fromJson(jsonObject);

    return response;
  }
}
