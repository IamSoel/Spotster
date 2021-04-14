import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sportster/constants/constants.dart';
import 'package:sportster/models/login_model.dart';
import 'package:sportster/models/register_model.dart';

class ApiService<T> {
  final String url;
  final dynamic body;
  final T Function(http.Response response) parse;

  ApiService({this.url, this.body, this.parse});
}

class UserApiProvider {
  Future<LoginModel> getLoginData<T>(ApiService resource) async {
    final response = await http.get(Uri.parse(baseUrl + resource.url));
    if (response.statusCode == 200) {
      Map<String, String> responseData = json.decode(response.body);

      return LoginModel.fromJson(responseData);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<LoginModel> postLoginData<T>(ApiService resource) async {
    Map<String, String> header = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
    final response = await http.post(Uri.http(baseUrl, resource.url),
        body: resource.body, headers: header);
    if (response.statusCode == 200) {
      Map<String, String> responseData = json.decode(response.body);

      return LoginModel.fromJson(responseData);
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<RegisterModel> getRegisterData<T>(ApiService resource) async {
    final response = await http.get(Uri.parse(baseUrl + resource.url));
    print(json.decode(response.body));
    return RegisterModel.fromJson(json.decode(response.body));
  }

  Future<RegisterModel> postRegisterData<T>(ApiService resource) async {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };
    final response = await http.post(
      Uri.parse(baseUrl + resource.url),
      body: resource.body,
      headers: header,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      return RegisterModel.fromJson(responseData);
    } else {
      throw Exception(response.statusCode);
    }
  }
}
