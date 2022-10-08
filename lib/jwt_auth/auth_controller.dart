import 'dart:convert';

import 'package:blissme/jwt_auth/home_page.dart';
import 'package:blissme/jwt_auth/jwt_log_in_screen.dart';
import 'package:blissme/jwt_auth/singleton.dart';
import 'package:blissme/screens/all_screen/home_screen.dart';
import 'package:blissme/todo_app/screens/home_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthController {
  static TextEditingController userName = TextEditingController();
  static TextEditingController password = TextEditingController();
  final client = http.Client();

  Future loginUser(context) async {
    print("Device Token${Singleton().accessToken}");
    const url = 'https://api.zois.app/user/login';
    final dio = Dio();
    try {
      final data = {
        'email': userName.text,
        'password': password.text,
      };
      print(data);
      var response = await dio.post(url, data: data, options: Options(
        validateStatus: (status) {
          return status == 200 || status == 400;
        },
      ));
      // body: jsonEncode({'email': 'poxiya8835@wnpop.com', 'password': '12345'}));
      print(response.data);
      if (response.statusCode == 200) {
        // var login = json.decode(response.body);
        final login = response.data;
        Singleton().accessToken=login['data']['token'];
        print(Singleton().accessToken);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage1(text: userName.text)));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.data['message'])));
      }
    } on DioError catch (e) {
      print("ex-----${e}");
    } catch (e) {}
  }

  Future userData(context)async{
    const url = 'https://api.zois.app/user';
    final dio = Dio();
    var res=await dio.get(url, options: Options(headers: {'authorization': Singleton().accessToken},
      validateStatus: (status) {
        return status == 200 || status == 401;
      },
    ));
    print(res);
    if (res.statusCode == 200) {
      final login = res.data;
      print(login);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(res.data['message'])));

      Navigator.push(context, MaterialPageRoute(builder: (context)=>JwtLogInScreen()));
    }
  }
}
