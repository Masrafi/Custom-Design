import 'dart:convert';

import '../domain/dataShowTwo_impl.dart';
import 'package:http/http.dart';

import '../model/model.dart';
class DropDownRepo implements DropDownIMPL{
  Future dataShowFetch() async {
    //var endPoint = 'https://stg.nexthehub.com/api/v3/auth/login';
        var endPoint = 'https://gssskhokhar.com/api/classes/';
        Response response = await get(Uri.parse(endPoint),);
        final List result = jsonDecode(response.body);
              print(response.body);    
              // final Map<String, dynamic> data = json.decode(response.body);
              // return DataView.fromJson(data);
              return result.map((e) => DropDownModel.fromJson(e)).toList();
  }
}