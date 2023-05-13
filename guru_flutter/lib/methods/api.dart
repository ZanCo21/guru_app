import 'package:guru_flutter/helper/constant.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class API{
  postRequest({
    required String route, 
    required Map<String, 
    String> data,
    }) async{
    String url=apiUrl+route;
    return await http.post(
      Uri.parse(url),
      body: jsonEncode(data), 
      headers: _header(),);
  }

  _header()=>{
    'content-type' : 'application/json',
    'Accept' : 'application/json',
  };
}