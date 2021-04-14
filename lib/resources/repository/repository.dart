import 'dart:convert';

import 'package:sportster/models/login_model.dart';
import 'package:sportster/models/register_model.dart';
import 'package:sportster/resources/networking/user_api_provider.dart';

class Repository {

   ApiService<LoginModel> getLogin(url, body) {
    return ApiService(
      url: url,
      body: body,
      parse: (response) {
        final parsed = jsonDecode(response.body);
        final dataJson = LoginModel.fromJson(parsed);
        print('Response data is ' + parsed);
        return dataJson;
      },
    );
  }

  static ApiService<RegisterModel> getRegister(url) {
    return ApiService(
      url: url,
    );
  }
}
