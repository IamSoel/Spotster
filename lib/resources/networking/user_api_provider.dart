import 'dart:convert';

import 'package:http/http.dart';
import 'package:sportster/models/register_model.dart';
import 'package:sportster/resources/repository/repository.dart';

class UserApiProvider implements Source {
  var client = Client();

  Future<RegisterModel> fetchUserData() async {
    final response = await client.get(Uri.parse('http://'));
    json.decode(response.body);
    return RegisterModel.fromJson(json.decode(response.body));
  }

  Future<int> addUserData(RegisterModel registerModel) {
    return null;
  }
}
