import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  static TextEditingController userName = TextEditingController();
  static TextEditingController password = TextEditingController();

  final client = http.Client();

  Future loginUser() async {
    const url = 'https://api.zois.app/user/login';
    final dio = Dio();
    try {
      final data = {'email': userName.text, 'password': password.text};
      var response = await dio.post(url, data: data, options: Options(
        validateStatus: (status) {
          return status == 200 || status == 400;},
      ));
      // body: jsonEncode({'email': 'poxiya8835@wnpop.com', 'password': '12345'}));

      if (response.statusCode == 200) {
        // var login = json.decode(response.body);
        final login = response.data;
        print(login);
      } else {

      }
    } on DioError catch (e) {
      print(e);
    } catch (e) {}
  }
}
